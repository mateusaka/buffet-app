require 'rails_helper'

describe 'Dono de buffet edita o seu buffet' do
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
    click_on 'Editar'

    expect(page).to have_content 'Editar Buffet'
    expect(page).to have_field 'Nome fantasia', with: 'ABC omidas'
    expect(page).to have_field 'Razão social', with: 'Buffet ABC'
    expect(page).to have_field 'CNPJ', with: '112233-4444'
    expect(page).to have_field 'Telefone', with: '(81) 987658866'
    expect(page).to have_field 'Email', with: 'abc@buffet.com'
    expect(page).to have_field 'Endereço', with: 'Avenida das comidas'
    expect(page).to have_field 'Bairro', with: 'Macaxeira'
    expect(page).to have_field 'Cidade', with: 'Jaboatão'
    expect(page).to have_field 'Estado', with: 'Pernambuco'
    expect(page).to have_field 'CEP', with: '52050-333'
    expect(page).to have_field 'Descrição', with: 'Um buffet que cobra por prato quebrado'
    expect(page).to have_field 'Método de pagamento', with: 'PIX'
  end

  it 'com sucesso' do
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
    click_on 'Editar'
    fill_in 'Nome fantasia', with: 'ABComidas'
    fill_in 'Método de pagamento', with: 'Cartão'
    click_on 'Atualizar Buffet'

    expect(page).to have_content 'Buffet atualizado com sucesso'
    expect(page).to have_content 'ABComidas'
    expect(page).to have_content 'Cartão'
    expect(page).not_to have_content 'ABC omidas'
    expect(page).not_to have_content 'PIX'
  end

  it 'e mantém os campos obrigatórios' do
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
    click_on 'Editar'
    fill_in 'Nome fantasia', with: ''
    fill_in 'Método de pagamento', with: ''
    click_on 'Atualizar Buffet'

    expect(page).to have_content 'Erro ao atualizar buffet'
  end
end
