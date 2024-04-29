require 'rails_helper'

RSpec.describe Client, type: :model do
  describe '#valid?' do
    it 'falso quando cpf está vazio' do
      client = Client.new(
        cpf: ''
      )

      client.valid?
      result = client.errors.include? :cpf

      expect(result).to eq true
    end

    it 'falso quando email está vazio' do
      client = Client.new(
        email: ''
      )

      client.valid?
      result = client.errors.include? :email

      expect(result).to eq true
    end

    it 'falso quando password está vazio' do
      client = Client.new(
        password: ''
      )

      client.valid?
      result = client.errors.include? :password

      expect(result).to eq true
    end
  end

  describe '#check_cpf' do
    it 'falso quando cpf está inválido' do
      client = Client.new(
        name: 'Mateus Cliente',
        cpf: '10365025039',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      result = client.valid?

      expect(result).to eq false
    end

    it 'true quando cpf está válido' do
      client = Client.new(
        name: 'Mateus Cliente',
        cpf: '10365025038',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      result = client.valid?

      expect(result).to eq true
    end
  end
end
