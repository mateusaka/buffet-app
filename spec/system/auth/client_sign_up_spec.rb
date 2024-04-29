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
end
