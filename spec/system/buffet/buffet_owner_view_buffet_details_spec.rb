require 'rails_helper'

describe 'Dono de buffet vê detalhes do buffet' do
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
    click_on 'Meu buffet'

    expect(page).not_to have_content 'Cade Buffet?'
    expect(page).to have_content 'ABC omidas'
    expect(page).to have_content 'Buffet ABC'
    expect(page).to have_content '112233-4444'
    expect(page).to have_content '(81) 987658866'
    expect(page).to have_content 'abc@buffet.com'
    expect(page).to have_content 'Avenida das comidas'
    expect(page).to have_content 'Macaxeira'
    expect(page).to have_content 'Jaboatão'
    expect(page).to have_content 'Pernambuco'
    expect(page).to have_content '52050-333'
    expect(page).to have_content 'Um buffet que cobra por prato quebrado'
    expect(page).to have_content 'PIX'
  end

  it 'e volta para tela inicial' do
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
    click_on 'Meu buffet'
    visit root_path

    expect(page).to have_content 'Cade Buffet?'
    expect(page).not_to have_content 'ABC omidas'
    expect(page).not_to have_content 'Buffet ABC'
    expect(page).not_to have_content '112233-4444'
    expect(page).not_to have_content '(81) 987658866'
    expect(page).not_to have_content 'abc@buffet.com'
    expect(page).not_to have_content 'Avenida das comidas'
    expect(page).not_to have_content 'Macaxeira'
    expect(page).not_to have_content 'Jaboatão'
    expect(page).not_to have_content 'Pernambuco'
    expect(page).not_to have_content '52050-333'
    expect(page).not_to have_content 'Um buffet que cobra por prato quebrado'
    expect(page).not_to have_content 'PIX'
  end
end
