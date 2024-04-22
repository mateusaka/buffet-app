require 'rails_helper'

describe 'Dono de buffet cadastra um evento' do
  it 'a partir da tela inicial' do
    buffet_owner = BuffetOwner.create!(
      name: 'Mateus Buffet Owner',
      email: 'mateus@gmail.com',
      password: '123456'
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    fill_in 'Nome fantasia', with: 'ABC omidas'
    fill_in 'Razão social', with: 'Buffet ABC'
    fill_in 'CNPJ', with: '112233-4444'
    fill_in 'Telefone', with: '(81) 987658866'
    fill_in 'Email', with: 'abc@buffet.com'
    fill_in 'Endereço', with: 'Avenida das comidas'
    fill_in 'Bairro', with: 'Macaxeira'
    fill_in 'Cidade', with: 'Jaboatão'
    fill_in 'Estado', with: 'Pernambuco'
    fill_in 'CEP', with: '52050-333'
    fill_in 'Descrição', with: 'Um buffet que cobra por prato quebrado'
    fill_in 'Método de pagamento', with: 'PIX'
    click_on 'Criar Buffet'
    visit root_path
    click_on 'Novo evento'

    expect(page).to have_content 'Cadastrar Evento'
    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Descrição'
    expect(page).to have_field 'Quantidade mínima de pessoas'
    expect(page).to have_field 'Quantidade máxima de pessoas'
    expect(page).to have_field 'Duração(minutos)'
    expect(page).to have_field 'Cardápio'
    expect(page).to have_field 'Bebida alcoólica'
    expect(page).to have_field 'Decoração'
    expect(page).to have_field 'Serviço de valet'
    expect(page).to have_field 'Informações sobre o local do evento. No endereço do Buffet ou do contratante'
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

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Novo evento'
    fill_in 'Nome', with: 'Super Evento'
    fill_in 'Descrição', with: 'Super descrição'
    fill_in 'Quantidade mínima de pessoas', with: 10
    fill_in 'Quantidade máxima de pessoas', with: 20
    fill_in 'Duração(minutos)', with: 60
    fill_in 'Cardápio', with: 'Lagosta'
    page.check 'Bebida alcoólica'
    fill_in 'Informações sobre o local do evento. No endereço do Buffet ou do contratante', with: 'Local do contratante'
    fill_in 'Preço base(final de semana)', with: 120
    fill_in 'Preço adicional por pessoa(final de semana)', with: 10
    fill_in 'Preço adicional por hora(final de semana)', with: 20
    click_on 'Criar Evento'

    expect(page).not_to have_content 'Erro ao cadastrar evento'
    expect(page).to have_content 'Evento cadastrado com sucesso'
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
    expect(page).to have_content '$ 10'
    expect(page).to have_content '$ 20'
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

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Novo evento'
    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Criar Evento'

    expect(page).to have_content 'Erro ao cadastrar evento'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Descrição não pode ficar em branco'
  end
end
