require 'rails_helper'

describe 'Dono de buffet cria conta' do
  it 'com sucesso' do
    visit root_path
    click_on 'Entrar(dono de buffet)'
    click_on 'Sign up'
    fill_in 'Nome', with: 'Mateus Buffet Owner'
    fill_in 'Email', with: 'mateus@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'mateus@gmail.com'
    expect(page).to have_button 'Sair'
    user = BuffetOwner.last
    expect(user.name).to eq 'Mateus Buffet Owner'
  end

  context 'sem sucesso' do
    it 'email inválido' do
      visit root_path
      click_on 'Entrar(dono de buffet)'
      click_on 'Sign up'
      fill_in 'Nome', with: 'Mateus Buffet Owner'
      fill_in 'Email', with: 'mateusgmail.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'

      expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).not_to have_content 'mateus@gmail.com'
      expect(page).not_to have_button 'Sair'
      expect(page).to have_content 'Não foi possível salvar dono de buffet'
      expect(page).to have_content 'Email não é válido'
    end

    it 'senha menor que 6 dígitos' do
      visit root_path
      click_on 'Entrar(dono de buffet)'
      click_on 'Sign up'
      fill_in 'Nome', with: 'Mateus Buffet Owner'
      fill_in 'Email', with: 'mateus@gmail.com'
      fill_in 'Password', with: '12345'
      fill_in 'Password confirmation', with: '12345'
      click_on 'Sign up'

      expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).not_to have_content 'mateus@gmail.com'
      expect(page).not_to have_button 'Sair'
      expect(page).to have_content 'Não foi possível salvar dono de buffet'
      expect(page).to have_content 'Password é muito curto (mínimo: 6 caracteres)'
    end

    it 'senha de confirmação diferente' do
      visit root_path
      click_on 'Entrar(dono de buffet)'
      click_on 'Sign up'
      fill_in 'Nome', with: 'Mateus Buffet Owner'
      fill_in 'Email', with: 'mateus@gmail.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123457'
      click_on 'Sign up'

      expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).not_to have_content 'mateus@gmail.com'
      expect(page).not_to have_button 'Sair'
      expect(page).to have_content 'Não foi possível salvar dono de buffet'
      expect(page).to have_content 'Password confirmation não é igual a Password'
    end
  end
end
