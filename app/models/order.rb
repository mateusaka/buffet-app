class Order < ApplicationRecord
  belongs_to :client
  belongs_to :buffet
  belongs_to :event
  enum status: {
    waiting: 0,
    confirmed: 1,
    canceled: 2
  }

  validates :event, :date, :quantity, :details,
            :code, :status, presence: true
  validates :payment_method, :fee_or_discount_reason,
            :payment_validity, presence:true, on: :update

  validate :check_quantity, :check_date
  validate :check_fee_or_discount, :check_payment_validity, on: :update

  before_validation :generate_code, on: :create

  attr_accessor :equal_date, :full_price

  def generate_code
    self.code = SecureRandom.alphanumeric(8).upcase
  end

  def check_payment_validity
    if payment_validity.present? && (payment_validity < Date.today || payment_validity > date)
      errors.add(:payment_validity_validate, 'não pode ser anterior a data atual ou depois da data do pedido')
    end
  end

  def check_fee_or_discount
    if extra_fee.present? == discount.present?
      errors.add(:fee_or_discount_validate, 'deve ser preenchido')
    end
  end

  def check_quantity
    if quantity.present? && (quantity < event.min_quantity || quantity > event.max_quantity)
      errors.add(:quantity_validate, "não pode ser diferente da informada no evento(#{event.min_quantity} - #{event.max_quantity})")
    end
  end

  def check_date
    if date.present?
      if date < Date.today
        return errors.add(:date_validate, 'escolhida não pode ser anterior a data atual')
      end

      event = Event.find(event_id)

      if (date.wday >= 1 && date.wday <= 5) && !event.weekday_base_price.present?
        return errors.add(:date_validate, 'não permitida(dia de semana)')
      end

      if (date.wday == 6 || date.wday == 0) && !event.weekend_base_price.present?
        errors.add(:date_validate, 'não permitida(final de semana)')
      end
    end
  end
end
