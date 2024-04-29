require 'rails_helper'

describe 'Cliente entra' do
  it 'com sucesso' do
    client = Client.create!(
      name: 'Mateus Cliente',
      cpf: 47229116732,
      email: 'mateus@cliente.com',
      password: 123456
    )

    login_as(client, scope: :client)
    visit root_path

    expect(page).not_to have_content 'Entrar(cliente)'
    expect(page).to have_content 'mateus@cliente.com'
    expect(page).to have_content 'Sair'
  end

  it 'e desloga' do
    client = Client.create!(
      name: 'Mateus Cliente',
      cpf: 47229116732,
      email: 'mateus@cliente.com',
      password: 123456
    )

    login_as(client, scope: :client)
    visit root_path
    click_on 'Sair'

    expect(page).not_to have_content 'Sair'
    expect(page).not_to have_content 'mateus@cliente.com'
    expect(page).to have_content 'Entrar(cliente)'
  end
end
