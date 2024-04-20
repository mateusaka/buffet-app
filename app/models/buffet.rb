class Buffet < ApplicationRecord
  belongs_to :buffet_owner

  validates :brand_name, :corporate_name, :cnpj, :phone,
            :email, :address, :district, :state, :city, :cep,
            :description, :payment_method, presence: true
  validates :cnpj, uniqueness: true
end
