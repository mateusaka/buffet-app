require 'rails_helper'

describe 'Dono de buffet vê pedidos' do
  it 'a partir da tela inicial' do
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
      details: 'Mais detalhes do pedido'
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Pedidos'

    expect(page).to have_content 'Pedidos para o seu buffet'
    expect(page).to have_content "#{order.code} - #{I18n.localize(order.date)} | #{order.status} | Aprovar | Recusar"
  end

  it 'e não vê pedido de outros donos de buffet' do
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

    client = Client.create!(
      name: 'Mateus Cliente',
      cpf: '10365025038',
      email: 'mateus@cliente.com',
      password: '123456'
    )

    second_client = Client.create!(
      name: 'Mateus2 Cliente',
      cpf: '56245418720',
      email: 'mateus2@cliente.com',
      password: '123456'
    )

    order = Order.create!(
      client: client,
      buffet: buffet,
      event: event,
      date: weekend_date,
      quantity: 12,
      details: 'Mais detalhes do pedido'
    )

    second_order = Order.create!(
      client: second_client,
      buffet: second_buffet,
      event: second_event,
      date: weekend_date,
      quantity: 100,
      details: 'Mais detalhes do pedido'
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Pedidos'

    expect(page).not_to have_content "#{second_order.code} - #{I18n.localize(second_order.date)} | #{second_order.status} | Aprovar | Recusar"
    expect(page).to have_content 'Pedidos para o seu buffet'
    expect(page).to have_content "#{order.code} - #{I18n.localize(order.date)} | #{order.status} | Aprovar | Recusar"
  end
end
