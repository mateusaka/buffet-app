require 'rails_helper'

describe 'Visitante busca por um buffet' do
  it 'e não está autenticado' do
    visit root_path

    expect(page).to have_field(placeholder: 'Buscar buffet')
    expect(page).to have_button('Buscar')
  end

  it 'e encontra um buffet pelo nome' do
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

    visit root_path

    fill_in 'Buscar buffet', with: 'ABC omidas'
    click_on 'Buscar'

    expect(page).not_to have_content 'Second | Natal - Rio Grande do Norte'
    expect(page).not_to have_content 'Luxus Comidas | São Paulo - São Paulo'
    expect(page).to have_content 'Resultados da busca por: ABC omidas'
    expect(page).to have_content 'ABC omidas | Jaboatão - Pernambuco'
  end

  it 'e encontra um buffet pela cidade' do
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

    visit root_path

    fill_in 'Buscar buffet', with: 'Natal'
    click_on 'Buscar'

    expect(page).not_to have_content 'ABC omidas | Jaboatão - Pernambuco'
    expect(page).not_to have_content 'Luxus Comidas | São Paulo - São Paulo'
    expect(page).to have_content 'Resultados da busca por: Natal'
    expect(page).to have_content 'Second | Natal - Rio Grande do Norte'
  end

  it 'e encontra um buffet pelo evento(tipo de festa)' do
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

    event = Event.create!(
      name: 'Casamento',
      description: 'Super descrição',
      min_quantity: 10,
      max_quantity: 20,
      duration: 60,
      menu: 'Lagosta',
      alcoholic_drink: true,
      party_decoration: false,
      valet_service: false,
      local: 'Local do contratante',
      buffet: second_buffet,
      weekend_base_price: 120,
      weekend_additional_price_person: 50,
      weekend_additional_price_hour: 30
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

    visit root_path

    fill_in 'Buscar buffet', with: 'Casamento'
    click_on 'Buscar'

    expect(page).not_to have_content 'ABC omidas | Jaboatão - Pernambuco'
    expect(page).not_to have_content 'Luxus Comidas | São Paulo - São Paulo'
    expect(page).to have_content 'Resultados da busca por: Casamento'
    expect(page).to have_content 'Second | Natal - Rio Grande do Norte'
  end

  it 'e encontra varios buffets' do
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
      brand_name: 'ABC food',
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

    visit root_path

    fill_in 'Buscar buffet', with: 'ABC'
    click_on 'Buscar'

    expect(page).not_to have_content 'Luxus Comidas | São Paulo - São Paulo'
    expect(page).to have_content 'Resultados da busca por: ABC'
    expect(page).to have_content 'ABC omidas | Jaboatão - Pernambuco'
    expect(page).to have_content 'ABC food | Natal - Rio Grande do Norte'
  end
end
