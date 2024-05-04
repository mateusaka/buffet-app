class OrdersController < ApplicationController
  before_action :authenticate_client!, except: [:show_to_buffet_owner, :show_details_to_buffet_owner]
  before_action :authenticate_buffet_owner!, except: [:index, :new, :create, :show]

  def index
    @orders = current_client.orders
  end

  def new
    @order = Order.new
    @events = Event.where('events.buffet_id = ?', params[:buffet_id])
  end

  def create
    @order = Order.new(params.require(:order).permit(
      :event_id,
      :date,
      :quantity,
      :details
    ))
    @order.client = current_client
    @order.buffet = Buffet.find(params[:buffet_id])

    if @order.save
      redirect_to orders_path, notice: 'Pedido realizado com sucesso'
    else
      @events = Event.where('events.buffet_id = ?', params[:buffet_id])
      flash.now[:notice] = 'Erro ao realizar pedido'
      render 'new'
    end
  end

  def show
    check_order = Order.find(params[:id])

    if !current_client.orders.include?(check_order)
      return redirect_to unauthorized_path
    end

    @order = check_order
  end

  def show_to_buffet_owner
    buffet = Buffet.find(current_buffet_owner.id)

    @orders = Order
    .where('buffet_id = ?', buffet.id)

    @orders.each do |order|
      next if order.equal_date == true || order.status == 'Pedido cancelado'

        @orders.each do |inside_order|
          next if inside_order.equal_date == true || inside_order.status == 'Pedido cancelado'

          if order != inside_order && order.date == inside_order.date
            order.equal_date = true
            inside_order.equal_date = true
          end
        end
    end
  end

  def show_details_to_buffet_owner
    check_order = Order.find(params[:id])

    if !current_buffet_owner.buffet.orders.include?(check_order)
      return redirect_to unauthorized_path
    end

    @order = check_order
  end
end
