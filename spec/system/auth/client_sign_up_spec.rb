require 'rails_helper'

describe 'Cliente cria conta' do
  it 'com sucesso' do
    visit root_path
    click_on 'Entrar(cliente)'
    click_on 'Sign up'
    fill_in 'Nome', with: 'Mateus Cliente'
    fill_in 'Email', with: 'mateus@cliente.com'
    fill_in 'CPF', with: 47229116732
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'mateus@cliente.com'
    expect(page).to have_button 'Sair'
    user = Client.last
    expect(user.name).to eq 'Mateus Cliente'
  end

  context 'sem sucesso' do
    it 'email inválido' do
      visit root_path
      click_on 'Entrar(cliente)'
      click_on 'Sign up'
      fill_in 'Nome', with: 'Mateus Cliente'
      fill_in 'Email', with: 'mateuscliente.com'
      fill_in 'CPF', with: 47229116732
      fill_in 'Password', with: 123456
      fill_in 'Password confirmation', with: 123456
      click_on 'Sign up'

      expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).not_to have_content 'mateuscliente.com'
      expect(page).not_to have_button 'Sair'
      expect(page).to have_content 'Não foi possível salvar cliente'
      expect(page).to have_content 'Email não é válido'
    end

    it 'senha menor que 6 dígitos' do
      visit root_path
      click_on 'Entrar(cliente)'
      click_on 'Sign up'
      fill_in 'Nome', with: 'Mateus Cliente'
      fill_in 'Email', with: 'mateus@cliente.com'
      fill_in 'CPF', with: 47229116732
      fill_in 'Password', with: 12345
      fill_in 'Password confirmation', with: 12345
      click_on 'Sign up'

      expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).not_to have_content 'mateus@cliente.com'
      expect(page).not_to have_button 'Sair'
      expect(page).to have_content 'Não foi possível salvar cliente'
      expect(page).to have_content 'Password é muito curto (mínimo: 6 caracteres)'
    end

    it 'senha de confirmação diferente' do
      visit root_path
      click_on 'Entrar(cliente)'
      click_on 'Sign up'
      fill_in 'Nome', with: 'Mateus Cliente'
      fill_in 'Email', with: 'mateus@gmail.com'
      fill_in 'CPF', with: 47229116732
      fill_in 'Password', with: 123456
      fill_in 'Password confirmation', with: 123457
      click_on 'Sign up'

      expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).not_to have_content 'mateus@gmail.com'
      expect(page).not_to have_button 'Sair'
      expect(page).to have_content 'Não foi possível salvar cliente'
      expect(page).to have_content 'Password confirmation não é igual a Password'
    end

    it 'cpf inválido' do
      visit root_path
      click_on 'Entrar(cliente)'
      click_on 'Sign up'
      fill_in 'Nome', with: 'Mateus Cliente'
      fill_in 'Email', with: 'mateus@gmail.com'
      fill_in 'CPF', with: 47229116730
      fill_in 'Password', with: 123456
      fill_in 'Password confirmation', with: 123456
      click_on 'Sign up'

      expect(page).not_to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
      expect(page).not_to have_content 'mateus@gmail.com'
      expect(page).not_to have_button 'Sair'
      expect(page).to have_content 'Não foi possível salvar cliente'
      expect(page).to have_content 'CPF inválido'
    end
  end
end
