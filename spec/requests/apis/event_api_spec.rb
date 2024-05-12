require 'rails_helper'

describe 'Event API' do
  context 'GET /api/v1/events/:id' do
    it 'com sucesso' do
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

      second_buffet_owner = BuffetOwner.create!(
        name: 'Lucas Buffet Owner',
        email: 'lucas@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Le Buffet',
        corporate_name: 'Food Corp',
        cnpj: '33-55',
        phone: '(81) 987658866',
        email: 'lebuff@buffet.com',
        address: 'Avenida das foods',
        district: 'Mandioca',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '76050-111',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'Cartão',
        buffet_owner: second_buffet_owner
      )

      second_event = Event.create!(
        name: 'The second',
        description: 'Apenas a segunda descrição',
        min_quantity: 50,
        max_quantity: 500,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: true,
        valet_service: true,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekend_additional_price_hour: 30
      )

      third_event = Event.create!(
        name: 'Happy Event',
        description: 'Apenas por diversão',
        min_quantity: 500,
        max_quantity: 1500,
        duration: 120,
        menu: 'Brigadeiro e coxinha',
        alcoholic_drink: false,
        party_decoration: true,
        valet_service: false,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 270,
        weekend_additional_price_person: 10,
        weekend_additional_price_hour: 90
      )

      get '/api/v1/events/2'

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
      expect(json_response).not_to include 'Le Buffet'
      expect(json_response[0]['name']).to eq 'The second'
      expect(json_response[1]['name']).to eq 'Happy Event'
    end

    it 'vazio se o id de buffet não corresponder a um evento' do
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

      second_buffet_owner = BuffetOwner.create!(
        name: 'Lucas Buffet Owner',
        email: 'lucas@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Le Buffet',
        corporate_name: 'Food Corp',
        cnpj: '33-55',
        phone: '(81) 987658866',
        email: 'lebuff@buffet.com',
        address: 'Avenida das foods',
        district: 'Mandioca',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '76050-111',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'Cartão',
        buffet_owner: second_buffet_owner
      )

      second_event = Event.create!(
        name: 'The second',
        description: 'Apenas a segunda descrição',
        min_quantity: 50,
        max_quantity: 500,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: true,
        valet_service: true,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekend_additional_price_hour: 30
      )

      third_event = Event.create!(
        name: 'Happy Event',
        description: 'Apenas por diversão',
        min_quantity: 500,
        max_quantity: 1500,
        duration: 120,
        menu: 'Brigadeiro e coxinha',
        alcoholic_drink: false,
        party_decoration: true,
        valet_service: false,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 270,
        weekend_additional_price_person: 10,
        weekend_additional_price_hour: 90
      )

      get '/api/v1/events/999'

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 0
    end
  end

  context 'GET /api/v1/events/availability' do
    it 'com sucesso' do
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
        max_quantity: 200,
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
        weekday_base_price: 320,
        weekday_additional_price_person: 250,
        weekday_additional_price_hour: 50
      )

      second_buffet_owner = BuffetOwner.create!(
        name: 'Lucas Buffet Owner',
        email: 'lucas@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Le Buffet',
        corporate_name: 'Food Corp',
        cnpj: '33-55',
        phone: '(81) 987658866',
        email: 'lebuff@buffet.com',
        address: 'Avenida das foods',
        district: 'Mandioca',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '76050-111',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'Cartão',
        buffet_owner: second_buffet_owner
      )

      second_event = Event.create!(
        name: 'The second',
        description: 'Apenas a segunda descrição',
        min_quantity: 50,
        max_quantity: 500,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: true,
        valet_service: true,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekend_additional_price_hour: 30
      )

      third_event = Event.create!(
        name: 'Happy Event',
        description: 'Apenas por diversão',
        min_quantity: 500,
        max_quantity: 1500,
        duration: 120,
        menu: 'Brigadeiro e coxinha',
        alcoholic_drink: false,
        party_decoration: true,
        valet_service: false,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 270,
        weekend_additional_price_person: 10,
        weekend_additional_price_hour: 90
      )

      get "/api/v1/events/availability?id=1&date=#{Date.today}&quantity=58"

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['value']).not_to eq "520.0"
      expect(json_response['value']).to eq "2520.0"
    end

    it 'erro se nao existir um id correspondente' do
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
        max_quantity: 200,
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
        weekday_base_price: 320,
        weekday_additional_price_person: 250,
        weekday_additional_price_hour: 50
      )

      second_buffet_owner = BuffetOwner.create!(
        name: 'Lucas Buffet Owner',
        email: 'lucas@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Le Buffet',
        corporate_name: 'Food Corp',
        cnpj: '33-55',
        phone: '(81) 987658866',
        email: 'lebuff@buffet.com',
        address: 'Avenida das foods',
        district: 'Mandioca',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '76050-111',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'Cartão',
        buffet_owner: second_buffet_owner
      )

      second_event = Event.create!(
        name: 'The second',
        description: 'Apenas a segunda descrição',
        min_quantity: 50,
        max_quantity: 500,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: true,
        valet_service: true,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekend_additional_price_hour: 30
      )

      third_event = Event.create!(
        name: 'Happy Event',
        description: 'Apenas por diversão',
        min_quantity: 500,
        max_quantity: 1500,
        duration: 120,
        menu: 'Brigadeiro e coxinha',
        alcoholic_drink: false,
        party_decoration: true,
        valet_service: false,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 270,
        weekend_additional_price_person: 10,
        weekend_additional_price_hour: 90
      )

      get "/api/v1/events/availability?id=999&date=#{Date.today}&quantity=58"

      expect(response.status).to eq 404
    end

    it 'erro se a data não estiver disponível' do
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
        max_quantity: 200,
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
        weekday_base_price: 320,
        weekday_additional_price_person: 250,
        weekday_additional_price_hour: 50
      )

      second_buffet_owner = BuffetOwner.create!(
        name: 'Lucas Buffet Owner',
        email: 'lucas@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Le Buffet',
        corporate_name: 'Food Corp',
        cnpj: '33-55',
        phone: '(81) 987658866',
        email: 'lebuff@buffet.com',
        address: 'Avenida das foods',
        district: 'Mandioca',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '76050-111',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'Cartão',
        buffet_owner: second_buffet_owner
      )

      second_event = Event.create!(
        name: 'The second',
        description: 'Apenas a segunda descrição',
        min_quantity: 50,
        max_quantity: 500,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: true,
        valet_service: true,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekday_base_price: 120,
        weekday_additional_price_person: 50,
        weekday_additional_price_hour: 30
      )

      third_event = Event.create!(
        name: 'Happy Event',
        description: 'Apenas por diversão',
        min_quantity: 500,
        max_quantity: 1500,
        duration: 120,
        menu: 'Brigadeiro e coxinha',
        alcoholic_drink: false,
        party_decoration: true,
        valet_service: false,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 270,
        weekend_additional_price_person: 10,
        weekend_additional_price_hour: 90
      )

      get "/api/v1/events/availability?id=2&date=#{weekend_date}&quantity=58"

      expect(response.status).to eq 403
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['error']).to eq 'Data não disponível'
    end

    it 'erro se a quantidade(para menos) não estiver disponível' do
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
        max_quantity: 200,
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
        weekday_base_price: 320,
        weekday_additional_price_person: 250,
        weekday_additional_price_hour: 50
      )

      second_buffet_owner = BuffetOwner.create!(
        name: 'Lucas Buffet Owner',
        email: 'lucas@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Le Buffet',
        corporate_name: 'Food Corp',
        cnpj: '33-55',
        phone: '(81) 987658866',
        email: 'lebuff@buffet.com',
        address: 'Avenida das foods',
        district: 'Mandioca',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '76050-111',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'Cartão',
        buffet_owner: second_buffet_owner
      )

      second_event = Event.create!(
        name: 'The second',
        description: 'Apenas a segunda descrição',
        min_quantity: 50,
        max_quantity: 500,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: true,
        valet_service: true,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekend_additional_price_hour: 30
      )

      third_event = Event.create!(
        name: 'Happy Event',
        description: 'Apenas por diversão',
        min_quantity: 500,
        max_quantity: 1500,
        duration: 120,
        menu: 'Brigadeiro e coxinha',
        alcoholic_drink: false,
        party_decoration: true,
        valet_service: false,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 270,
        weekend_additional_price_person: 10,
        weekend_additional_price_hour: 90
      )

      get "/api/v1/events/availability?id=2&date=#{weekend_date}&quantity=28"

      expect(response.status).to eq 403
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['error']).to eq 'Quantidade não disponível'
    end

    it 'erro se a quantidade(para mais) não estiver disponível' do
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
        max_quantity: 200,
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
        weekday_base_price: 320,
        weekday_additional_price_person: 250,
        weekday_additional_price_hour: 50
      )

      second_buffet_owner = BuffetOwner.create!(
        name: 'Lucas Buffet Owner',
        email: 'lucas@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Le Buffet',
        corporate_name: 'Food Corp',
        cnpj: '33-55',
        phone: '(81) 987658866',
        email: 'lebuff@buffet.com',
        address: 'Avenida das foods',
        district: 'Mandioca',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '76050-111',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'Cartão',
        buffet_owner: second_buffet_owner
      )

      second_event = Event.create!(
        name: 'The second',
        description: 'Apenas a segunda descrição',
        min_quantity: 50,
        max_quantity: 500,
        duration: 60,
        menu: 'Lagosta',
        alcoholic_drink: true,
        party_decoration: true,
        valet_service: true,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 120,
        weekend_additional_price_person: 50,
        weekend_additional_price_hour: 30
      )

      third_event = Event.create!(
        name: 'Happy Event',
        description: 'Apenas por diversão',
        min_quantity: 500,
        max_quantity: 1500,
        duration: 120,
        menu: 'Brigadeiro e coxinha',
        alcoholic_drink: false,
        party_decoration: true,
        valet_service: false,
        local: 'Local do contratante',
        buffet: second_buffet,
        weekend_base_price: 270,
        weekend_additional_price_person: 10,
        weekend_additional_price_hour: 90
      )

      get "/api/v1/events/availability?id=2&date=#{weekend_date}&quantity=608"

      expect(response.status).to eq 403
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['error']).to eq 'Quantidade não disponível'
    end
  end
end
