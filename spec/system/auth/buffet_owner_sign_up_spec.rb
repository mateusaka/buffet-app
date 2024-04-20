require 'rails_helper'

describe 'Dono de buffet cria conta' do
  it 'com sucesso' do
    visit root_path
    click_on 'Entrar'
    click_on 'Sign up'
    fill_in 'Name', with: 'Mateus Buffet Owner'
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
end
