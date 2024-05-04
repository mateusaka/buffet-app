require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it 'true quando date está vazio' do
      order = Order.new(
        date: ''
      )

      order.valid?
      result = order.errors.include? :date

      expect(result).to eq true
    end

    it 'true quando quantity está vazio' do
      order = Order.new(
        quantity: ''
      )

      order.valid?
      result = order.errors.include? :quantity

      expect(result).to eq true
    end

    it 'true quando details está vazio' do
      order = Order.new(
        details: ''
      )

      order.valid?
      result = order.errors.include? :details

      expect(result).to eq true
    end
  end

  describe '#generate_code' do
    it 'gera um código aleatório' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.create!(
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

      event = Event.create!(
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
        weekend_additional_price_hour: 30
      )

      client = Client.create!(
        name: 'Mateus Cliente',
        cpf: '10365025038',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      order = Order.create!(
        client: client,
        buffet: buffet,
        event: event,
        date: 1.day.from_now,
        quantity: 20,
        details: 'Mais detalhes do pedido'
      )

      order.save!

      expect(order.code).not_to be_empty
      expect(order.code.length).to eq 8
    end

    it 'e o código é único' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.create!(
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

      event = Event.create!(
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
        weekend_additional_price_hour: 30
      )

      client = Client.create!(
        name: 'Mateus Cliente',
        cpf: '10365025038',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      order = Order.create!(
        client: client,
        buffet: buffet,
        event: event,
        date: 1.day.from_now,
        quantity: 20,
        details: 'Mais detalhes do pedido'
      )

      second_order = Order.new(
        client: client,
        buffet: buffet,
        event: event,
        date: 1.day.from_now,
        quantity: 20,
        details: 'Mais detalhes do pedido'
      )

      second_order.save!

      expect(second_order.code).not_to eq order.code
    end
  end

  describe '#generate_status' do
    it 'gera o status padrão: Aguardando avaliação do buffet' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.create!(
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

      event = Event.create!(
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
        weekend_additional_price_hour: 30
      )

      client = Client.create!(
        name: 'Mateus Cliente',
        cpf: '10365025038',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      order = Order.create!(
        client: client,
        buffet: buffet,
        event: event,
        date: 1.day.from_now,
        quantity: 20,
        details: 'Mais detalhes do pedido'
      )

      order.save!

      expect(order.status).not_to be_empty
      expect(order.status).to eq 'Aguardando avaliação do buffet'
    end
  end

  describe '#check_quantity' do
    it 'não pode ser inferior a quantidade mínima' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.create!(
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

      event = Event.create!(
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
        weekend_additional_price_hour: 30
      )

      client = Client.create!(
        name: 'Mateus Cliente',
        cpf: '10365025038',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      order = Order.new(
        client: client,
        buffet: buffet,
        event: event,
        date: 1.day.from_now,
        quantity: 5,
        details: 'Alguns pequenos detalhes'
      )

      order.valid?

      expect(order.errors.full_messages).to include 'Quantidade de pessoas não pode ser diferente da informada no evento(10 - 20)'
    end

    it 'não pode ser superior a quantidade máxima' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.create!(
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

      event = Event.create!(
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
        weekend_additional_price_hour: 30
      )

      client = Client.create!(
        name: 'Mateus Cliente',
        cpf: '10365025038',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      order = Order.new(
        client: client,
        buffet: buffet,
        event: event,
        date: 1.day.from_now,
        quantity: 25,
        details: 'Alguns pequenos detalhes'
      )

      order.valid?

      expect(order.errors.full_messages).to include 'Quantidade de pessoas não pode ser diferente da informada no evento(10 - 20)'
    end
  end

  describe '#check_date' do
    it 'nao pode ser uma data anterior a data atual' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      buffet = Buffet.create!(
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

      event = Event.create!(
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
        weekend_additional_price_hour: 30
      )

      client = Client.create!(
        name: 'Mateus Cliente',
        cpf: '10365025038',
        email: 'mateus@cliente.com',
        password: '123456'
      )

      order = Order.new(
        client: client,
        buffet: buffet,
        event: event,
        date: 2.days.ago,
        quantity: 12,
        details: 'Alguns pequenos detalhes'
      )

      order.valid?

      expect(order.errors.full_messages).to include 'Data escolhida não pode ser anterior a data atual'
    end
  end
end
