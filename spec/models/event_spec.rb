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

  describe '#check_weekend_and_weekday' do
    it 'falso quando weekend está preenchido e weekday está incompleto' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'ABC omidas',
        corporate_name: 'Buffet ABC',
        cnpj: '112233-4444',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Pernambuco',
        city: 'Jaboatão',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      event = Event.new(
        name: 'Super Evento',
        description: 'Super descrição',
        min_quantity: 10,
        max_quantity: 20,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: false,
        valet_service: false,
        local: 'Local do contratante',
        buffet: buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekend_additional_price_hour: 30,
        weekday_base_price: 300
      )

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando weekday está preenchido e weekend está incompleto' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'ABC omidas',
        corporate_name: 'Buffet ABC',
        cnpj: '112233-4444',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Pernambuco',
        city: 'Jaboatão',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      event = Event.new(
        name: 'Super Evento',
        description: 'Super descrição',
        min_quantity: 10,
        max_quantity: 20,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: false,
        valet_service: false,
        local: 'Local do contratante',
        buffet: buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekday_base_price: 300,
        weekday_additional_price_person: 10,
        weekday_additional_price_hour: 35
      )

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando weekdend está incompleto e weekday está incompleto' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'ABC omidas',
        corporate_name: 'Buffet ABC',
        cnpj: '112233-4444',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Pernambuco',
        city: 'Jaboatão',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      event = Event.new(
        name: 'Super Evento',
        description: 'Super descrição',
        min_quantity: 10,
        max_quantity: 20,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: false,
        valet_service: false,
        local: 'Local do contratante',
        buffet: buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekday_base_price: 300,
        weekday_additional_price_hour: 35
      )

      result = event.valid?

      expect(result).to eq false
    end

    it 'falso quando weekday e weekend não estão preenchidos' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'ABC omidas',
        corporate_name: 'Buffet ABC',
        cnpj: '112233-4444',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Pernambuco',
        city: 'Jaboatão',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      event = Event.new(
        name: 'Super Evento',
        description: 'Super descrição',
        min_quantity: 10,
        max_quantity: 20,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: false,
        valet_service: false,
        local: 'Local do contratante',
        buffet: buffet
      )

      result = event.valid?

      expect(result).to eq false
    end

    it 'true quando weekend e weekday estão preenchidos' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'ABC omidas',
        corporate_name: 'Buffet ABC',
        cnpj: '112233-4444',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Pernambuco',
        city: 'Jaboatão',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      event = Event.new(
        name: 'Super Evento',
        description: 'Super descrição',
        min_quantity: 10,
        max_quantity: 20,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: false,
        valet_service: false,
        local: 'Local do contratante',
        buffet: buffet,
        weekend_base_price: 10,
        weekend_additional_price_person: 20,
        weekend_additional_price_hour: 30,
        weekday_base_price: 40,
        weekday_additional_price_person: 50,
        weekday_additional_price_hour: 60,
      )

      result = event.valid?

      expect(result).to eq true
    end

    it 'true quando weekend está preenchido e weekday não está preenchido' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'ABC omidas',
        corporate_name: 'Buffet ABC',
        cnpj: '112233-4444',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Pernambuco',
        city: 'Jaboatão',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      event = Event.new(
        name: 'Super Evento',
        description: 'Super descrição',
        min_quantity: 10,
        max_quantity: 20,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: false,
        valet_service: false,
        local: 'Local do contratante',
        buffet: buffet,
        weekend_base_price: 10,
        weekend_additional_price_person: 20,
        weekend_additional_price_hour: 30
      )

      result = event.valid?

      expect(result).to eq true
    end

    it 'true quando weekday está preenchido e weekend não está preenchido' do
      buffet_owner = BuffetOwner.new(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.new(
        brand_name: 'ABC omidas',
        corporate_name: 'Buffet ABC',
        cnpj: '112233-4444',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Pernambuco',
        city: 'Jaboatão',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: buffet_owner
      )

      event = Event.new(
        name: 'Super Evento',
        description: 'Super descrição',
        min_quantity: 10,
        max_quantity: 20,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: false,
        valet_service: false,
        local: 'Local do contratante',
        buffet: buffet,
        weekday_base_price: 40,
        weekday_additional_price_person: 50,
        weekday_additional_price_hour: 60
      )

      result = event.valid?

      expect(result).to eq true
    end
  end
end
