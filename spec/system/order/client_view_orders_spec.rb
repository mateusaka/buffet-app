require 'rails_helper'

describe 'Cliente vê os seus pedidos' do
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

    second_order = Order.create!(
      client: client,
      buffet: buffet,
      event: event,
      date: weekend_date,
      quantity: 17,
      details: 'Mais detalhes do segundo pedido'
    )

    login_as(client, scope: :client)
    visit root_path
    click_on 'Meus pedidos'

    expect(page).to have_content "#{order.code} - #{I18n.localize(order.date)}"
    expect(page).to have_content "#{second_order.code} - #{I18n.localize(second_order.date)}"
  end

  it 'e não vê pedido de outros usuários' do
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
      quantity: 15,
      details: 'Mais detalhes do pedido'
    )

    second_client = Client.create!(
      name: 'Mateus2 Cliente',
      cpf: '53216174654',
      email: 'mateus2@cliente.com',
      password: '123456'
    )

    second_order = Order.create!(
      client: second_client,
      buffet: buffet,
      event: event,
      date: weekend_date,
      quantity: 19,
      details: 'Mais detalhes do segundo pedido'
    )

    login_as(client, scope: :client)
    visit root_path
    click_on 'Meus pedidos'

    expect(page).not_to have_content "#{second_order.code} - #{I18n.localize(second_order.date)}"
    expect(page).to have_content 'Pedidos'
    expect(page).to have_content "#{order.code} - #{I18n.localize(order.date)}"
  end
end
