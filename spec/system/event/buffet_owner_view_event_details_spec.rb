require 'rails_helper'

describe 'Dono de buffet vê detalhes de um evento' do
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
    fill_in 'Nome', with: 'Super Evento'
    fill_in 'Descrição', with: 'Super descrição'
    fill_in 'Quantidade mínima de pessoas', with: 10
    fill_in 'Quantidade máxima de pessoas', with: 20
    fill_in 'Duração(minutos)', with: 60
    fill_in 'Cardápio', with: 'Lagosta'
    page.check 'Bebida alcoólica'
    fill_in 'Informações sobre o local do evento. No endereço do Buffet ou do contratante', with: 'Local do contratante'
    click_on 'Criar Evento'
    visit root_path
    click_on 'Meus eventos'
    click_on 'Super Evento'

    expect(page).to have_content 'Super Evento'
    expect(page).to have_content 'Super descrição'
    expect(page).to have_content '10 - 20'
    expect(page).to have_content '60 minutos'
    expect(page).to have_content 'Lagosta'
    expect(page).to have_content 'Bebida Alcoólica ✅ Sim'
    expect(page).to have_content 'Decoração ❌ Não'
    expect(page).to have_content 'Serviço de valete ❌ Não'
    expect(page).to have_content 'Local do contratante'
  end

  it 'e volta para a tela inicial' do
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
    fill_in 'Nome', with: 'Super Evento'
    fill_in 'Descrição', with: 'Super descrição'
    fill_in 'Quantidade mínima de pessoas', with: 10
    fill_in 'Quantidade máxima de pessoas', with: 20
    fill_in 'Duração(minutos)', with: 60
    fill_in 'Cardápio', with: 'Lagosta'
    page.check 'Bebida alcoólica'
    fill_in 'Informações sobre o local do evento. No endereço do Buffet ou do contratante', with: 'Local do contratante'
    click_on 'Criar Evento'
    visit root_path
    click_on 'Meus eventos'
    click_on 'Super Evento'
    click_on 'Home'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Cade Buffet?'
  end
end
