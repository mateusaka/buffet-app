require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#valid?' do
    it 'falso quando name está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Buffet',
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
      buffet.save

      event = Event.new(
        name: '',
        description: 'Event description',
        min_quantity: 10,
        max_quantity: 50,
        duration: 60,
        menu: 'Lagosta',
        local: 'Local do contratante'
      )
      event.buffet = buffet

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando description está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Buffet',
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
      buffet.save

      event = Event.new(
        name: 'Event',
        description: '',
        min_quantity: 10,
        max_quantity: 50,
        duration: 60,
        menu: 'Lagosta',
        local: 'Local do contratante'
      )
      event.buffet = buffet

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando min_quantity está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Buffet',
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
      buffet.save

      event = Event.new(
        name: 'Event',
        description: 'Event description',
        min_quantity: '',
        max_quantity: 50,
        duration: 60,
        menu: 'Lagosta',
        local: 'Local do contratante'
      )
      event.buffet = buffet

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando max_quantity está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Buffet',
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
      buffet.save

      event = Event.new(
        name: 'Event',
        description: 'Event description',
        min_quantity: 10,
        max_quantity: '',
        duration: 60,
        menu: 'Lagosta',
        local: 'Local do contratante'
      )
      event.buffet = buffet

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando duration está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Buffet',
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
      buffet.save

      event = Event.new(
        name: 'Event',
        description: 'Event description',
        min_quantity: 10,
        max_quantity: 50,
        duration: '',
        menu: 'Lagosta',
        local: 'Local do contratante'
      )
      event.buffet = buffet

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando menu está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Buffet',
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
      buffet.save

      event = Event.new(
        name: 'Event',
        description: 'Event description',
        min_quantity: 10,
        max_quantity: 50,
        duration: 60,
        menu: '',
        local: 'Local do contratante'
      )
      event.buffet = buffet

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando local está vazio' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'Buffet',
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
      buffet.save

      event = Event.new(
        name: 'Event',
        description: 'Event description',
        min_quantity: 10,
        max_quantity: 50,
        duration: 60,
        menu: 'Lagosta',
        local: ''
      )
      event.buffet = buffet

      result = event.valid?

      expect(result).to eq false
    end
  end
end
