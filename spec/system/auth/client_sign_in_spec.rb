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

  context 'sem sucesso' do
    it 'email inválido' do
      client = Client.create!(
      name: 'Mateus Cliente',
      cpf: 47229116732,
      email: 'mateus@cliente.com',
      password: 123456
    )

      visit root_path
      click_on 'Entrar(cliente)'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 123456
      click_on 'Log in'

      expect(page).not_to have_content 'test@gmail.com'
      expect(page).not_to have_content 'Sair'
      expect(page).to have_content 'Email ou senha inválidos.'
      expect(page).to have_content 'Entrar(cliente)'
    end

    it 'senha inválida' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      visit root_path
      click_on 'Entrar(cliente)'
      fill_in 'Email', with: 'mateus@gmail.com'
      fill_in 'Password', with: 123457
      click_on 'Log in'

      expect(page).not_to have_content 'mateus@gmail.com'
      expect(page).not_to have_content 'Sair'
      expect(page).to have_content 'Email ou senha inválidos.'
      expect(page).to have_content 'Entrar(cliente)'
    end
  end
end
