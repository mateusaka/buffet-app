require 'rails_helper'

RSpec.describe BuffetOwner, type: :model do
  describe '#valid?' do
    it 'falso quando email está vazio' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: '',
        password: '123456'
      )

      result = buffet_owner.valid?

      expect(result).to eq false
    end

    it 'falso quando password está vazio' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: ''
      )

      result = buffet_owner.valid?

      expect(result).to eq false
    end
  end
end
