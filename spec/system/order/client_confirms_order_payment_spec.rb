require 'rails_helper'

describe 'Cliente confirma pedido e faz o pagamento' do
  it 'e vê mensagem Aguardando avaliação do cliente a partir da tela inicial' do
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

    order.status = 'Pedido confirmado'

    order.update(
      payment_method: 'PIX',
      extra_fee: 200,
      fee_or_discount_reason: 'Eu sou a lei',
      payment_validity: Date.today
    )

    login_as(client, scope: :client)
    visit root_path
    click_on 'Meus pedidos'

    expect(page).not_to have_content 'Aguardando avaliação do buffet'
    expect(page).not_to have_content 'Pedido cancelado'
    expect(page).to have_content 'Pedido confirmado'
    expect(page).to have_content 'Aguardando avaliação do cliente'
    expect(page).to have_content "#{order.code}"
    expect(page).to have_content "#{I18n.localize(order.date)}"
  end

  it 'e clica no código do pedido a partir da tela inicial' do
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

    order.status = 'Pedido confirmado'

    order.update(
      payment_method: 'PIX',
      extra_fee: 200,
      fee_or_discount_reason: 'Eu sou a lei',
      payment_validity: Date.today
    )

    login_as(client, scope: :client)
    visit root_path
    click_on 'Meus pedidos'
    click_on "#{order.code}"

    expect(page).not_to have_content 'Aguardando avaliação do buffet'
    expect(page).not_to have_content 'Pedido cancelado'
    expect(page).to have_content 'Pedido confirmado'
    expect(page).to have_content "#{order.code}"
    expect(page).to have_content "#{I18n.localize(order.payment_validity)}"
    expect(page).to have_content 'Pagar'
  end

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

    order.status = 'Pedido confirmado'

    order.update(
      payment_method: 'PIX',
      extra_fee: 200,
      fee_or_discount_reason: 'Eu sou a lei',
      payment_validity: Date.today
    )

    login_as(client, scope: :client)
    visit root_path
    click_on 'Meus pedidos'
    click_on "#{order.code}"
    click_on 'Pagar'

    expect(page).not_to have_content 'Aguardando avaliação do buffet'
    expect(page).not_to have_content 'Aguardando avaliação do cliente'
    expect(page).not_to have_content 'Pedido confirmado'
    expect(page).not_to have_content 'Pedido cancelado'
    expect(page).to have_content 'Pagamento realizado com sucesso'
    expect(page).to have_content 'Evento será realizado'
    expect(page).to have_content "#{order.code}"
    expect(page).to have_content "#{I18n.localize(order.date)}"
  end
end
