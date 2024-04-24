require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#valid?' do
    it 'true quando name está vazio' do
      event = Event.new(
        name: ''
      )

      event.valid?
      result = event.errors.include? :name

      expect(result).to eq true
    end

    it 'true quando description está vazio' do
      event = Event.new(
        description: ''
      )

      event.valid?
      result = event.errors.include? :description

      expect(result).to eq true
    end

    it 'true quando min_quantity está vazio' do
      event = Event.new(
        min_quantity: ''
      )

      event.valid?
      result = event.errors.include? :min_quantity

      expect(result).to eq true
    end

    it 'true quando max_quantity está vazio' do
      event = Event.new(
        max_quantity: ''
      )

      event.valid?
      result = event.errors.include? :max_quantity

      expect(result).to eq true
    end

    it 'true quando duration está vazio' do
      event = Event.new(
        duration: ''
      )

      event.valid?
      result = event.errors.include? :duration

      expect(result).to eq true
    end

    it 'true quando menu está vazio' do
      event = Event.new(
        menu: ''
      )

      event.valid?
      result = event.errors.include? :menu

      expect(result).to eq true
    end

    it 'true quando local está vazio' do
      event = Event.new(
        local: ''
      )

      event.valid?
      result = event.errors.include? :local

      expect(result).to eq true
    end
  end

  describe '#check_weekend_and_weekday' do
    it 'false quando weekend está preenchido e weekday está incompleto' do
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

    it 'false quando weekday está preenchido e weekend está incompleto' do
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

    it 'false quando weekdend está incompleto e weekday está incompleto' do
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

    it 'false quando weekday e weekend não estão preenchidos' do
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

  describe '#check_min_max_quantity' do
    it 'true quando quantidade máxima é menor que mínima' do
      event = Event.new(
        min_quantity: 5,
        max_quantity: 2
      )

      event.valid?
      result = event.errors.include? :max_quantity_validate

      expect(result).to eq true
    end

    it 'true quando quantidade mínima é inferior a 1' do
      event = Event.new(
        min_quantity: 0
      )

      event.valid?
      result = event.errors.include? :min_quantity_validate

      expect(result).to eq true
    end

    it 'true quando quantidade mínima é inferior a 1' do
      event = Event.new(
        min_quantity: -1
      )

      event.valid?
      result = event.errors.include? :min_quantity_validate

      expect(result).to eq true
    end
  end
end
