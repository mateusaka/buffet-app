class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :cpf, presence: true, uniqueness: true

  validate :check_cpf

  def check_cpf
    if !CPF.valid?(cpf)
      errors.add(:cpf_validate, 'inválido')
    end
  end
end
