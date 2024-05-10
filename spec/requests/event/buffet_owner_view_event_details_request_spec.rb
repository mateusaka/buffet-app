require 'rails_helper'

describe 'Dono de buffet vê detalhes de um evento' do
  it 'e tenta visualizar um evento que não é seu' do
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

    login_as(buffet_owner, scope: :buffet_owner)
    get(event_path(second_event))

    expect(response).to redirect_to(unauthorized_path)
  end
end
