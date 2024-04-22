require 'rails_helper'

describe 'Dono de buffet vê detalhes de um evento' do
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

    second_event = Event.create!(
      name: 'Meu Evento Dois',
      description: 'Um evento que tem o número dois',
      min_quantity: 30,
      max_quantity: 70,
      duration: 120,
      menu: 'Coxinha',
      alcoholic_drink: false,
      party_decoration: true,
      valet_service: false,
      local: 'Local do contratante',
      buffet: buffet,
      weekday_base_price: 300,
      weekday_additional_price_person: 90,
      weekday_additional_price_hour: 10
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Meus eventos'
    click_on 'Super Evento'

    expect(page).not_to have_content 'Meu Evento Dois'
    expect(page).not_to have_content 'Um evento que tem o número dois'
    expect(page).not_to have_content '$ 300'
    expect(page).not_to have_content '$ 90'
    expect(page).not_to have_content '$ 10'
    expect(page).to have_content 'Super Evento'
    expect(page).to have_content 'Super descrição'
    expect(page).to have_content '10 - 20'
    expect(page).to have_content '60 minutos'
    expect(page).to have_content 'Lagosta'
    expect(page).to have_content 'Bebida Alcoólica ✅ Sim'
    expect(page).to have_content 'Decoração ❌ Não'
    expect(page).to have_content 'Serviço de valete ❌ Não'
    expect(page).to have_content 'Local do contratante'
    expect(page).to have_content '$ 120'
    expect(page).to have_content '$ 50'
    expect(page).to have_content '$ 30'
  end

  it 'e volta para a tela inicial' do
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

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Meus eventos'
    click_on 'Super Evento'
    click_on 'Home'

    expect(current_path).to eq root_path
    expect(page).not_to have_content 'Super Evento'
    expect(page).not_to have_content 'Super descrição'
    expect(page).not_to have_content '$ 50'
    expect(page).to have_content 'Cade Buffet?'
  end
end
