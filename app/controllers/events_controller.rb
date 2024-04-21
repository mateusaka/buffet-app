class EventsController < ApplicationController
  before_action :authenticate_buffet_owner!

  def index
    if !current_buffet_owner.buffet
      return redirect_to new_buffet_path
    end

    @events = current_buffet_owner.buffet.events
  end

  def new
    if !current_buffet_owner.buffet
      return redirect_to new_buffet_path
    end

    @event = Event.new
  end

  def create
    if !current_buffet_owner.buffet
      return redirect_to new_buffet_path
    end

    @event = Event.new(params.require(:event).permit(
      :name,
      :description,
      :min_quantity,
      :max_quantity,
      :duration,
      :menu,
      :alcoholic_drink,
      :party_decoration,
      :valet_service,
      :local
    ))
    @event.buffet = current_buffet_owner.buffet

    if @event.save
      redirect_to @event, notice: 'Evento cadastrado com sucesso'
    else
      flash.now[:notice] = 'Erro ao cadastrar evento'
      render 'new'
    end
  end

  def show
    check_event = Event.find(params[:id])

    if !current_buffet_owner.buffet.events.include?(check_event)
      return redirect_to unauthorized_path
    end

    @event = check_event
  end
end
