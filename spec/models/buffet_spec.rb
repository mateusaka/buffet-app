require 'rails_helper'

RSpec.describe Buffet, type: :model do
  describe '#valid?' do
    it 'true quando brand_name está vazio' do
      buffet = Buffet.new(
        brand_name: ''
      )

      buffet.valid?
      result = buffet.errors.include? :brand_name

      expect(result).to eq true
    end

    it 'true quando corporate_name está vazio' do
      buffet = Buffet.new(
        corporate_name: ''
      )

      buffet.valid?
      result = buffet.errors.include? :corporate_name

      expect(result).to eq true
    end

    it 'true quando cnpj está vazio' do
      buffet = Buffet.new(
        cnpj: ''
      )

      buffet.valid?
      result = buffet.errors.include? :cnpj

      expect(result).to eq true
    end

    it 'true quando phone está vazio' do
      buffet = Buffet.new(
        phone: ''
      )

      buffet.valid?
      result = buffet.errors.include? :phone

      expect(result).to eq true
    end

    it 'true quando email está vazio' do
      buffet = Buffet.new(
        email: ''
      )

      buffet.valid?
      result = buffet.errors.include? :email

      expect(result).to eq true
    end

    it 'true quando address está vazio' do
      buffet = Buffet.new(
        address: ''
      )

      buffet.valid?
      result = buffet.errors.include? :address

      expect(result).to eq true
    end

    it 'true quando district está vazio' do
      buffet = Buffet.new(
        district: ''
      )

      buffet.valid?
      result = buffet.errors.include? :address

      expect(result).to eq true
    end

    it 'true quando state está vazio' do
      buffet = Buffet.new(
        state: ''
      )

      buffet.valid?
      result = buffet.errors.include? :state

      expect(result).to eq true
    end

    it 'true quando city está vazio' do
      buffet = Buffet.new(
        city: ''
      )

      buffet.valid?
      result = buffet.errors.include? :city

      expect(result).to eq true
    end

    it 'true quando cep está vazio' do
      buffet = Buffet.new(
        cep: ''
      )

      buffet.valid?
      result = buffet.errors.include? :cep

      expect(result).to eq true
    end

    it 'true quando description está vazio' do
      buffet = Buffet.new(
        description: ''
      )

      buffet.valid?
      result = buffet.errors.include? :description

      expect(result).to eq true
    end

    it 'true quando payment_method está vazio' do
      buffet = Buffet.new(
        payment_method: ''
      )

      buffet.valid?
      result = buffet.errors.include? :payment_method

      expect(result).to eq true
    end

    it 'true quando buffet_owner está vazio' do
      buffet = Buffet.new(
        buffet_owner: nil
      )

      buffet.valid?
      result = buffet.errors.include? :buffet_owner

      expect(result).to eq true
    end

    it 'true quando o cnpj já está em uso' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.create!(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '333',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      second_buffet = Buffet.new(
        cnpj: '333'
      )

      second_buffet.valid?
      result = second_buffet.errors.include? :cnpj

      expect(result).to eq true
    end
  end
end
