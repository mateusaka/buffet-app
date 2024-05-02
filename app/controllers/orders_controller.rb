class OrdersController < ApplicationController
  before_action :authenticate_client!

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
end
