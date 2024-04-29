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
end
