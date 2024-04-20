class Event < ApplicationRecord
  belongs_to :buffet

  validates :name, :description, :min_quantity, :max_quantity,
            :duration, :menu, :local, presence: true
end
