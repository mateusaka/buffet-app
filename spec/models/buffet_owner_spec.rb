require 'rails_helper'

RSpec.describe BuffetOwner, type: :model do
  describe '#valid?' do
    it 'falso quando email está vazio' do
      buffet_owner = BuffetOwner.new(
        email: ''
      )

      buffet_owner.valid?
      result = buffet_owner.errors.include? :email

      expect(result).to eq true
    end

    it 'falso quando password está vazio' do
      buffet_owner = BuffetOwner.new(
        password: ''
      )

      buffet_owner.valid?
      result = buffet_owner.errors.include? :password

      expect(result).to eq true
    end
  end
end
