require 'rails_helper'

describe 'Buffet API' do
  context 'GET /api/v1/buffets' do
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

      second_buffet_owner = BuffetOwner.create!(
        name: 'Mateus2 Buffet Owner',
        email: 'mateus2@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Second',
        corporate_name: 'Number Corp',
        cnpj: '112233-44442',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: second_buffet_owner
      )

      third_buffet_owner = BuffetOwner.create!(
        name: 'Mateus3 Buffet Owner',
        email: 'mateus3@gmail.com',
        password: '123456'
      )

      third_buffet = Buffet.create!(
        brand_name: 'Luxus Comidas',
        corporate_name: 'Luxos Corp',
        cnpj: '112233-44442333',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'São Paulo',
        city: 'São Paulo',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: third_buffet_owner
      )

      get '/api/v1/buffets'

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 3
      expect(json_response[0]['brand_name']).to eq 'ABC omidas'
      expect(json_response[1]['brand_name']).to eq 'Second'
      expect(json_response[2]['brand_name']).to eq 'Luxus Comidas'
    end

    it 'vazio se não tiver buffet' do
      get '/api/v1/buffets'

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 0
    end
  end

  context 'GET /api/v1/buffets/search' do
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

      second_buffet_owner = BuffetOwner.create!(
        name: 'Mateus2 Buffet Owner',
        email: 'mateus2@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Second',
        corporate_name: 'Number Corp',
        cnpj: '112233-44442',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: second_buffet_owner
      )

      third_buffet_owner = BuffetOwner.create!(
        name: 'Mateus3 Buffet Owner',
        email: 'mateus3@gmail.com',
        password: '123456'
      )

      third_buffet = Buffet.create!(
        brand_name: 'Luxus Comidas',
        corporate_name: 'Luxos Corp',
        cnpj: '112233-44442333',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'São Paulo',
        city: 'São Paulo',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: third_buffet_owner
      )

      get '/api/v1/buffets/search?name=Luxus Comidas'

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 1
      expect(json_response[0]['brand_name']).not_to eq 'ABC omidas'
      expect(json_response[0]['brand_name']).not_to eq 'Second'
      expect(json_response[0]['brand_name']).to eq 'Luxus Comidas'
      expect(json_response[0]['address']).to eq 'Avenida das comidas'
    end

    it 'vazio se não corresponder a busca' do
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

      second_buffet_owner = BuffetOwner.create!(
        name: 'Mateus2 Buffet Owner',
        email: 'mateus2@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Second',
        corporate_name: 'Number Corp',
        cnpj: '112233-44442',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: second_buffet_owner
      )

      third_buffet_owner = BuffetOwner.create!(
        name: 'Mateus3 Buffet Owner',
        email: 'mateus3@gmail.com',
        password: '123456'
      )

      third_buffet = Buffet.create!(
        brand_name: 'Luxus Comidas',
        corporate_name: 'Luxos Corp',
        cnpj: '112233-44442333',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'São Paulo',
        city: 'São Paulo',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: third_buffet_owner
      )

      get '/api/v1/buffets/search?name=Luxus ComidasA'

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 0
      expect(json_response).not_to include 'ABC omidas'
      expect(json_response).not_to include 'Second'
      expect(json_response).not_to include 'Luxus Comidas'
    end
  end

  context 'GET /api/v1/buffets/:id' do
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

      second_buffet_owner = BuffetOwner.create!(
        name: 'Mateus2 Buffet Owner',
        email: 'mateus2@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Second',
        corporate_name: 'Number Corp',
        cnpj: '112233-44442',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: second_buffet_owner
      )

      third_buffet_owner = BuffetOwner.create!(
        name: 'Mateus3 Buffet Owner',
        email: 'mateus3@gmail.com',
        password: '123456'
      )

      third_buffet = Buffet.create!(
        brand_name: 'Luxus Comidas',
        corporate_name: 'Luxos Corp',
        cnpj: '112233-44442333',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'São Paulo',
        city: 'São Paulo',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: third_buffet_owner
      )

      get '/api/v1/buffets/3'

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response['brand_name']).not_to eq 'ABC omidas'
      expect(json_response['brand_name']).not_to eq 'Second'
      expect(json_response['brand_name']).to eq 'Luxus Comidas'
    end

    it 'erro se não existir um id correspondente' do
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

      second_buffet_owner = BuffetOwner.create!(
        name: 'Mateus2 Buffet Owner',
        email: 'mateus2@gmail.com',
        password: '123456'
      )

      second_buffet = Buffet.create!(
        brand_name: 'Second',
        corporate_name: 'Number Corp',
        cnpj: '112233-44442',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'Rio Grande do Norte',
        city: 'Natal',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: second_buffet_owner
      )

      third_buffet_owner = BuffetOwner.create!(
        name: 'Mateus3 Buffet Owner',
        email: 'mateus3@gmail.com',
        password: '123456'
      )

      third_buffet = Buffet.create!(
        brand_name: 'Luxus Comidas',
        corporate_name: 'Luxos Corp',
        cnpj: '112233-44442333',
        phone: '(81) 987658866',
        email: 'abc@buffet.com',
        address: 'Avenida das comidas',
        district: 'Macaxeira',
        state: 'São Paulo',
        city: 'São Paulo',
        cep: '52050-333',
        description: 'Um buffet que cobra por prato quebrado',
        payment_method: 'PIX',
        buffet_owner: third_buffet_owner
      )

      get '/api/v1/buffets/999'

      expect(response.status).to eq 404
    end
  end
end
