class OrdersController < ApplicationController
  before_action :authenticate_client!, except: [
    :show_to_buffet_owner,
    :show_details_to_buffet_owner,
    :confirm,
    :confirm_update
  ]
  before_action :authenticate_buffet_owner!, except: [
    :index,
    :new,
    :create,
    :show,
    :payment
  ]

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
      :details,
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

    event = Event.find(@order.event_id)
    people = (@order.quantity - event.min_quantity).to_f

    if @order.date.wday >= 1 && @order.date.wday <= 5
      @order.full_price = event.weekday_base_price.to_f + (event.weekday_additional_price_person.to_f * people)
    else
      @order.full_price = event.weekend_base_price.to_f + (event.weekend_additional_price_person.to_f * people)
    end

    @current_date = Date.today
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

    event = Event.find(@order.event_id)
    people = (@order.quantity - event.min_quantity).to_f

    if @order.date.wday >= 1 && @order.date.wday <= 5
      @order.full_price = event.weekday_base_price.to_f + (event.weekday_additional_price_person.to_f * people)
    else
      @order.full_price = event.weekend_base_price.to_f + (event.weekend_additional_price_person.to_f * people)
    end
  end

  def confirm
    check_order = Order.find(params[:id])

    if !current_buffet_owner.buffet.orders.include?(check_order)
      return redirect_to unauthorized_path
    end

    @order = check_order
    @event = Event.find(@order.event_id)
    @buffet = Buffet.find(@order.buffet_id)
  end

  def confirm_update
    check_order = Order.find(params[:id])

    if !current_buffet_owner.buffet.orders.include?(check_order)
      return redirect_to unauthorized_path
    end

    @order = check_order

    if @order.update(params.require(:order).permit(
      :payment_method,
      :discount,
      :extra_fee,
      :fee_or_discount_reason,
      :payment_validity
    ))
      @order.update_attribute(:status, 'Pedido confirmado')
      redirect_to show_to_buffet_owner_orders_path, notice: 'Pedido confirmado com sucesso'
    else
      @event = Event.find(@order.event_id)
      @buffet = Buffet.find(@order.buffet_id)
      flash.now[:notice] = 'Erro ao confirmar pedido'
      render 'confirm'
    end
  end

  def payment
    check_order = Order.find(params[:id])

    if !current_client.orders.include?(check_order)
      return redirect_to unauthorized_path
    end

    if check_order.status != 'Pedido confirmado'
      return redirect_to orders_path, notice: 'Voce ainda não pode realizar essa ação'
    end

    check_order.update_attribute(:payment_done, true)

    redirect_to orders_path, notice: 'Pagamento realizado com sucesso'
  end
end
