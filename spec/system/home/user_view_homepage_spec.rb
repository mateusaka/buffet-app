require 'rails_helper'

describe 'Usuário visita a tela inicial' do
  it 'e vê o nome do app' do
    visit root_path

    expect(page).to have_content 'Cade Buffet?'
  end

  it 'e clica no botão home' do
    visit root_path

    click_on 'Home'

    expect(current_path).to eq root_path
  end
end
