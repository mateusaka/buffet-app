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

    third_event = Event.create!(
      name: 'Casamento',
      description: 'Uma descrição para eventos de casamento',
      min_quantity: 75,
      max_quantity: 370,
      duration: 60,
      menu: 'Peixe',
      alcoholic_drink: true,
      party_decoration: true,
      valet_service: true,
      local: 'Local do buffet',
      buffet: third_buffet,
      weekday_base_price: 520,
      weekday_additional_price_person: 70,
      weekday_additional_price_hour: 10
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

    third_event = Event.create!(
      name: 'Casamento',
      description: 'Uma descrição para eventos de casamento',
      min_quantity: 75,
      max_quantity: 370,
      duration: 60,
      menu: 'Peixe',
      alcoholic_drink: true,
      party_decoration: true,
      valet_service: true,
      local: 'Local do buffet',
      buffet: third_buffet,
      weekday_base_price: 520,
      weekday_additional_price_person: 70,
      weekday_additional_price_hour: 10
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

    third_event = Event.create!(
      name: 'Casamento',
      description: 'Uma descrição para eventos de casamento',
      min_quantity: 75,
      max_quantity: 370,
      duration: 60,
      menu: 'Peixe',
      alcoholic_drink: true,
      party_decoration: true,
      valet_service: true,
      local: 'Local do buffet',
      buffet: third_buffet,
      weekday_base_price: 520,
      weekday_additional_price_person: 70,
      weekday_additional_price_hour: 10
    )

    visit root_path

    fill_in 'Buscar buffet', with: 'ABC'
    click_on 'Buscar'

    expect(page).not_to have_content 'Luxus Comidas | São Paulo - São Paulo'
    expect(page).to have_content 'Resultados da busca por: ABC'
    expect(page).to have_content 'ABC omidas | Jaboatão - Pernambuco'
    expect(page).to have_content 'ABC food | Natal - Rio Grande do Norte'
  end

  it 'mas o buffet não possui eventos' do
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

    expect(page).to have_content 'Não foram encontrados resultados'
  end

  it 'seleciona o buffet e vê todas as informações do buffet, inclusive os eventos' do
    buffet_owner = BuffetOwner.create!(
      name: 'Mateus Buffet Owner',
      email: 'mateus@gmail.com',
      password: '123456'
    )

    buffet = Buffet.create!(
      brand_name: 'ABC omidas',
      corporate_name: 'Buffet ABC',
      cnpj: '112233',
      phone: '(81) 987658866',
      email: 'abc@buffet.com',
      address: 'Avenida das comidas',
      district: 'Mandioca',
      state: 'São Paulo',
      city: 'São Paulo',
      cep: '52050-000',
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
      cnpj: '996622',
      phone: '(81) 987654444',
      email: 'abc@buffet.com',
      address: 'Avenida das coxinhas',
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
      cnpj: '445566',
      phone: '(81) 987658777',
      email: 'third@buffet.com',
      address: 'Avenida das comidas',
      district: 'Macaxeira',
      state: 'São Paulo',
      city: 'São Paulo',
      cep: '5000-777',
      description: 'Um buffet que não cobra por prato quebrado',
      payment_method: 'PIX',
      buffet_owner: third_buffet_owner
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
      buffet: second_buffet,
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
      buffet: third_buffet,
      weekend_base_price: 220,
      weekend_additional_price_person: 20,
      weekend_additional_price_hour: 60
    )

    third_event = Event.create!(
      name: 'Casamento',
      description: 'Uma descrição para eventos de casamento',
      min_quantity: 75,
      max_quantity: 370,
      duration: 60,
      menu: 'Peixe',
      alcoholic_drink: true,
      party_decoration: true,
      valet_service: true,
      local: 'Local do buffet',
      buffet: third_buffet,
      weekday_base_price: 520,
      weekday_additional_price_person: 70,
      weekday_additional_price_hour: 10
    )

    visit root_path

    fill_in 'Buscar buffet', with: 'Luxus'
    click_on 'Buscar'
    click_on 'Luxus Comidas'

    expect(page).not_to have_content 'ABC omidas'
    expect(page).not_to have_content 'abc@buffet.com'
    expect(page).not_to have_content '52050-000'
    expect(page).not_to have_content 'Super Evento'
    expect(page).not_to have_content 'Lagosta'
    expect(page).not_to have_content '20 - 50'
    expect(page).to have_content 'Luxus Comidas'
    expect(page).to have_content 'third@buffet.com'
    expect(page).to have_content '5000-777'
    expect(page).to have_content 'Aniversário'
    expect(page).to have_content 'Caviar'
    expect(page).to have_content '100 - 500'
    expect(page).to have_content 'Casamento'
    expect(page).to have_content 'Peixe'
    expect(page).to have_content '75 - 370'
  end

  it 'e encontra varios buffets em ordem alfabética' do
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
      city: 'Recife',
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
      state: 'Pernambuco',
      city: 'Recife',
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
      state: 'Pernambuco',
      city: 'Recife',
      cep: '52050-333',
      description: 'Um buffet que cobra por prato quebrado',
      payment_method: 'PIX',
      buffet_owner: third_buffet_owner
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

    third_event = Event.create!(
      name: 'Casamento',
      description: 'Uma descrição para eventos de casamento',
      min_quantity: 75,
      max_quantity: 370,
      duration: 60,
      menu: 'Peixe',
      alcoholic_drink: true,
      party_decoration: true,
      valet_service: true,
      local: 'Local do buffet',
      buffet: third_buffet,
      weekday_base_price: 520,
      weekday_additional_price_person: 70,
      weekday_additional_price_hour: 10
    )

    visit root_path

    fill_in 'Buscar buffet', with: 'Recife'
    click_on 'Buscar'

    expect(page).to have_content 'Resultados da busca por: Recife'
    within('#search div:nth-of-type(1)') do
      expect(page).to have_content 'ABC food'
    end
    within('#search div:nth-of-type(2)') do
      expect(page).to have_content 'ABC omidas'
    end
    within('#search div:nth-of-type(3)') do
      expect(page).to have_content 'Luxus Comidas'
    end
  end
end
