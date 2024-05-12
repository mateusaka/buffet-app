require 'rails_helper'

describe 'Dono de buffet aprova pedido' do
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
    click_on "#{order.code}"
    click_on 'Aprovar'

    expect(page).to have_content 'Valor'
    expect(page).to have_content 'Meios de pagamento do seu buffet'
    expect(page).to have_content 'Taxa extra'
    expect(page).to have_content 'Desconto'
    expect(page).to have_content 'Motivo da taxa extra ou desconto'
    expect(page).to have_content 'Forma de pagamento'
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
      details: 'Mais detalhes do pedido'
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Pedidos'
    click_on "#{order.code}"
    click_on 'Aprovar'
    fill_in 'Forma de pagamento', with: 'PIX'
    fill_in 'Taxa extra', with: 200
    fill_in 'Motivo da taxa extra ou desconto', with: 'Eu sou a lei'
    fill_in 'Validade do pagamento', with: Date.today
    click_on 'Confirmar Pedido'

    expect(page).not_to have_content 'Erro ao confirmar pedido'
    expect(page).not_to have_content 'Aguardando avaliação do buffet'
    expect(page).to have_content 'Pedido confirmado com sucesso'
  end
end
