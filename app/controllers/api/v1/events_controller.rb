class Api::V1::EventsController < ActionController::API
  def show
    events = Event.where('buffet_id = ?', params[:id])

    render status: 200, json: events
  end

  def availability
    begin
      event = Event.find(params[:id])
      date = Date.parse(params[:date])
      quantity = params[:quantity].to_i

      if quantity < event.min_quantity || quantity > event.max_quantity
        return render status: 403, json: {
          error: 'Quantidade não disponível'
        }
      end

      if date.on_weekend? && event.weekend_base_price.present?
        render status: 200, json: {
          value: "#{
            (quantity - event.min_quantity) * event.weekend_additional_price_person +
            event.weekend_base_price
          }"
        }
      elsif date.on_weekday? && event.weekday_base_price.present?
        render status: 200, json: {
          value: "#{
            (quantity - event.min_quantity) * event.weekday_additional_price_person +
            event.weekday_base_price
          }"
        }
      else
        render status: 403, json: {
          error: 'Data não disponível'
        }
      end
    rescue
      render status: 404
    end
  end
end
