require 'rails_helper'

describe 'Dono de buffet entra' do
  it 'com sucesso' do
    buffet_owner = BuffetOwner.create!(
      name: 'Mateus Buffet Owner',
      email: 'mateus@gmail.com',
      password: '123456'
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path

    expect(page).not_to have_content 'Entrar(dono de buffet)'
    expect(page).to have_content 'mateus@gmail.com'
    expect(page).to have_content 'Sair'
  end

  it 'e desloga' do
    buffet_owner = BuffetOwner.create!(
      name: 'Mateus Buffet Owner',
      email: 'mateus@gmail.com',
      password: '123456'
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Sair'

    expect(page).not_to have_content 'Sair'
    expect(page).not_to have_content 'mateus@gmail.com'
    expect(page).to have_content 'Entrar(dono de buffet)'
  end

  it 'e caso não tenha buffet cadastrado redireciona para a pagina de cadastro' do
    buffet_owner = BuffetOwner.create!(
      name: 'Mateus Buffet Owner',
      email: 'mateus@gmail.com',
      password: '123456'
    )

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path

    user = BuffetOwner.last
    if !user.buffet
      expect(current_path).to eq new_buffet_path
    end
  end

  context 'sem sucesso' do
    it 'email inválido' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      visit root_path
      click_on 'Entrar(dono de buffet)'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 123456
      click_on 'Log in'

      expect(page).not_to have_content 'test@gmail.com'
      expect(page).not_to have_content 'Sair'
      expect(page).to have_content 'Email ou senha inválidos.'
      expect(page).to have_content 'Entrar(dono de buffet)'
    end

    it 'senha inválida' do
      buffet_owner = BuffetOwner.create!(
        name: 'Mateus Buffet Owner',
        email: 'mateus@gmail.com',
        password: '123456'
      )

      visit root_path
      click_on 'Entrar(dono de buffet)'
      fill_in 'Email', with: 'mateus@gmail.com'
      fill_in 'Password', with: 123457
      click_on 'Log in'

      expect(page).not_to have_content 'mateus@gmail.com'
      expect(page).not_to have_content 'Sair'
      expect(page).to have_content 'Email ou senha inválidos.'
      expect(page).to have_content 'Entrar(dono de buffet)'
    end
  end
end
