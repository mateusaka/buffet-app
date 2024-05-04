class Order < ApplicationRecord
  belongs_to :client
  belongs_to :buffet
  belongs_to :event

  validates :event, :date, :quantity, :details,
            :code, :status, presence: true

  validate :check_quantity, :check_date

  before_validation :generate_code, :generate_status

  attr_accessor :equal_date

  def generate_code
    self.code = SecureRandom.alphanumeric(8).upcase
  end

  def generate_status
    self.status = 'Aguardando avaliação do buffet'
  end

  def check_quantity
    if quantity.present? && (quantity < event.min_quantity || quantity > event.max_quantity)
      errors.add(:quantity_validate, "não pode ser diferente da informada no evento(#{event.min_quantity} - #{event.max_quantity})")
    end
  end

  def check_date
    if date.present? && date < Date.today
      errors.add(:date_validate, 'escolhida não pode ser anterior a data atual')
    end
  end
end
