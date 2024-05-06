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

    it 'true quando payment_method está vazio' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        payment_method: ''
      )

      result = order.errors.include? :payment_method

      expect(result).to eq true
    end

    it 'true quando fee_or_discount_reason está vazio' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        fee_or_discount_reason: ''
      )

      result = order.errors.include? :payment_method

      expect(result).to eq true
    end

    it 'true quando payment_validity está vazio' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        payment_validity: ''
      )

      result = order.errors.include? :payment_method

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
        date: weekend_date,
        quantity: 20,
        details: 'Mais detalhes do pedido'
      )

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
        date: weekend_date,
        quantity: 20,
        details: 'Mais detalhes do pedido'
      )

      second_order = Order.new(
        client: client,
        buffet: buffet,
        event: event,
        date: weekend_date,
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
        date: weekend_date,
        quantity: 20,
        details: 'Mais detalhes do pedido'
      )

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
        date: weekend_date,
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
        date: weekend_date,
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

  describe '#check_fee_or_discount' do
    it 'desconto está preenchido' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        discount: 10,
        fee_or_discount_reason: 'Eu sou a lei'
      )

      expect(order.errors.full_messages).not_to include 'Taxa extra ou desconto deve ser preenchido'
    end

    it 'taxa extra está preenchido' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        extra_fee: 10,
        fee_or_discount_reason: 'Eu sou a lei'
      )

      expect(order.errors.full_messages).not_to include 'Taxa extra ou desconto deve ser preenchido'
    end

    it 'desconto e taxa extra não estão preenchidos' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        fee_or_discount_reason: 'Eu sou a lei'
      )

      expect(order.errors.full_messages).to include 'Taxa extra ou desconto deve ser preenchido'
    end

    it 'desconto e taxa extra estão preenchidos' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        discount: 10,
        extra_fee: 10,
        fee_or_discount_reason: 'Eu sou a lei'
      )

      expect(order.errors.full_messages).to include 'Taxa extra ou desconto deve ser preenchido'
    end
  end

  describe '#check_payment_validity' do
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

      order = Order.create!(
        client: client,
        buffet: buffet,
        event: event,
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        fee_or_discount_reason: 'Eu sou a lei',
        payment_validity: 2.days.ago
      )

      expect(order.errors.full_messages).to include 'Validade do pagamento não pode ser anterior a data atual ou depois da data do pedido'
    end

    it 'nao pode ser uma data depois da data do pedido' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        fee_or_discount_reason: 'Eu sou a lei',
        payment_validity: weekend_date + 3.days
      )

      expect(order.errors.full_messages).to include 'Validade do pagamento não pode ser anterior a data atual ou depois da data do pedido'
    end

    it 'data entre hoje e o dia da validade' do
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
        date: weekend_date,
        quantity: 12,
        details: 'Alguns pequenos detalhes',
      )

      order.update(
        fee_or_discount_reason: 'Eu sou a lei',
        payment_validity: Date.today
      )

      expect(order.errors.full_messages).not_to include 'Validade do pagamento não pode ser anterior a data atual ou depois da data do pedido'
    end
  end
end
