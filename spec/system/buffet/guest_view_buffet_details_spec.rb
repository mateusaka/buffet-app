require 'rails_helper'

describe 'Visitante vê detalhes de um buffet' do
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

    first_event = Event.create!(
      name: 'Super Evento',
      description: 'Super descrição',
      min_quantity: 20,
      max_quantity: 50,
      duration: 60,
      menu: 'Lagosta',
      alcoholic_drink: true,
      party_decoration: false,
      valet_service: true,
      local: 'Local do contratante',
      buffet: buffet,
      weekend_base_price: 120,
      weekend_additional_price_person: 50,
      weekend_additional_price_hour: 30
    )

    second_event = Event.create!(
      name: 'Aniversário',
      description: 'Faça sua festa de aniversário com nosso buffet',
      min_quantity: 100,
      max_quantity: 500,
      duration: 60,
      menu: 'Caviar',
      alcoholic_drink: false,
      party_decoration: false,
      valet_service: false,
      local: 'Local do buffet',
      buffet: second_buffet,
      weekend_base_price: 220,
      weekend_additional_price_person: 20,
      weekend_additional_price_hour: 60
    )

    visit root_path
    click_on 'Le Buffet'

    expect(page).not_to have_content 'Food Corp'
    expect(page).not_to have_content 'ABC omidas'
    expect(page).to have_content 'Le Buffet'
    expect(page).to have_content '33-55'
    expect(page).to have_content '(81) 987658866'
    expect(page).to have_content 'lebuff@buffet.com'
    expect(page).to have_content 'Avenida das foods | Mandioca - Natal - Rio Grande do Norte | 76050-111'
    expect(page).to have_content 'Um buffet que cobra por prato quebrado'
    expect(page).to have_content 'Cartão'
  end

  it 'e volta para a tela de buffets' do
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

    first_event = Event.create!(
      name: 'Super Evento',
      description: 'Super descrição',
      min_quantity: 20,
      max_quantity: 50,
      duration: 60,
      menu: 'Lagosta',
      alcoholic_drink: true,
      party_decoration: false,
      valet_service: true,
      local: 'Local do contratante',
      buffet: buffet,
      weekend_base_price: 120,
      weekend_additional_price_person: 50,
      weekend_additional_price_hour: 30
    )

    second_event = Event.create!(
      name: 'Aniversário',
      description: 'Faça sua festa de aniversário com nosso buffet',
      min_quantity: 100,
      max_quantity: 500,
      duration: 60,
      menu: 'Caviar',
      alcoholic_drink: false,
      party_decoration: false,
      valet_service: false,
      local: 'Local do buffet',
      buffet: second_buffet,
      weekend_base_price: 220,
      weekend_additional_price_person: 20,
      weekend_additional_price_hour: 60
    )

    visit root_path
    click_on 'Le Buffet'
    click_on 'Home'

    expect(page).to have_content 'Cade Buffet?'
    expect(page).not_to have_content 'Buffet ABC'
    expect(page).not_to have_content 'Food Corp'
    expect(page).not_to have_content '33-55'
    expect(page).not_to have_content 'lebuff@buffet.com'
  end
end
