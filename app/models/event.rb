class Event < ApplicationRecord
  belongs_to :buffet
  has_many :orders

  validates :name, :description, :min_quantity, :max_quantity,
            :duration, :menu, :local, presence: true

  validate :check_weekend_and_weekday, :check_min_max_quantity

  def check_min_max_quantity
    if min_quantity.present? && min_quantity < 1
      return errors.add(:min_quantity_validate, 'não pode ser inferior a zero')
    end

    if max_quantity.present? && min_quantity.present? && max_quantity < min_quantity
      errors.add(:max_quantity_validate, 'não pode ser inferior a quantidade mínima')
    end
  end

  def weekend
    [
      weekend_base_price.blank?,
      weekend_additional_price_person.blank?,
      weekend_additional_price_hour.blank?
    ]
  end

  def weekday
    [
      weekday_base_price.blank?,
      weekday_additional_price_person.blank?,
      weekday_additional_price_hour.blank?
    ]
  end

  def check_weekend_and_weekday
    if max_quantity.present? && min_quantity.present?
      if weekend.all?(false) && weekday.all?(false)
        return
      end

      if weekend.all?(true) && weekday.all?(true)
        return errors.add(:weekend_and_or_weekday_validate, 'deve ser preenchido')
      end

      if (weekend.all?(false) && weekday.include?(false)) || (weekend.include?(false) && weekday.all?(false))
        return errors.add(:weekend_and_or_weekday_validate, 'deve ser preenchido')
      end

      if weekend.include?(false) && weekday.include?(false)
        errors.add(:weekend_and_or_weekday_validate, 'deve ser preenchido')
      end
    end
  end
end
