require 'rails_helper'

RSpec.describe Buffet, type: :model do
  describe '#valid?' do
    it 'falso quando brand_name está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: '',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando corporate_name está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: '',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando cnpj está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando phone está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando email está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: '',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando address está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: '',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando district está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: '',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando state está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: '',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando city está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: '',
        cep: '52050-111',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando cep está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '',
        description: 'Desc',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando description está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: '',
        payment_method: 'PIX'
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando payment_method está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Brand name',
        corporate_name: 'Corp name',
        cnpj: '12345',
        phone: '(81) 977777777',
        email: 'email@email.com',
        address: 'Address',
        district: 'Dis',
        state: 'State',
        city: 'City',
        cep: '52050-111',
        description: 'Desc',
        payment_method: ''
      )
      buffet.buffet_owner = buffet_owner

      result = buffet.valid?

      expect(result).to eq false
    end

    it 'falso quando o cnpj já está em uso' do
      first_buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      first_buffet = Buffet.new(
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
        payment_method: 'PIX'
      )
      first_buffet.buffet_owner = first_buffet_owner
      first_buffet.save

      second_buffet_owner = BuffetOwner.create!(
        name: 'Mateus2 Buffet Owner',
        email: 'mateus2@gmail.com',
        password: '123457'
      )

      second_buffet = Buffet.new(
        brand_name: 'Brand name2',
        corporate_name: 'Corp name2',
        cnpj: '333',
        phone: '(81) 977777772',
        email: 'email2@email.com',
        address: 'Address2',
        district: 'Dis2',
        state: 'State2',
        city: 'City2',
        cep: '52050-112',
        description: 'Desc2',
        payment_method: 'Cartão'
      )
      second_buffet.buffet_owner = second_buffet_owner

      result = second_buffet.valid?

      expect(result).to eq false
    end
  end
end
