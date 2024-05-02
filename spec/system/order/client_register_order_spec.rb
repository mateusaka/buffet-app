require 'rails_helper'

describe 'Cliente faz um novo pedido' do
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

    login_as(client)
    visit root_path
    click_on 'ABC omidas'
    click_on 'Reserve'

    expect(page).to have_content 'Novo pedido'
    expect(page).to have_content 'Evento'
    expect(page).to have_content 'Data'
    expect(page).to have_content 'Quantidade de pessoas'
    expect(page).to have_content 'Detalhes'
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

    allow(SecureRandom).to receive(:alphanumeric).with(8).and_return('12ER5AAB')

    login_as(client)
    visit root_path
    click_on 'ABC omidas'
    click_on 'Reserve'
    select 'Super Evento', from: 'Evento'
    fill_in 'Data', with: 1.day.from_now
    fill_in 'Quantidade de pessoas', with: 20
    fill_in 'Detalhes', with: 'No meu local'
    click_on 'Criar Pedido'

    expect(page).to have_content 'Pedido realizado com sucesso'
    expect(page).to have_content 'Pedidos'
    expect(page).to have_content "12ER5AAB - #{I18n.localize(1.day.from_now.to_date)}"
  end

  it 'com dados incompletos' do
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

    login_as(client)
    visit root_path
    click_on 'ABC omidas'
    click_on 'Reserve'
    select 'Super Evento', from: 'Evento'
    fill_in 'Data', with: ''
    fill_in 'Quantidade de pessoas', with: ''
    fill_in 'Detalhes', with: ''
    click_on 'Criar Pedido'

    expect(page).not_to have_content 'Pedido realizado com sucesso'
    expect(page).to have_content 'Erro ao realizar pedido'
    expect(page).to have_content 'Data não pode ficar em branco'
    expect(page).to have_content 'Quantidade de pessoas não pode ficar em branco'
    expect(page).to have_content 'Detalhes não pode ficar em branco'
  end
end
