require 'rails_helper'

describe 'Usuário visita a tela inicial' do
  it 'e vê o nome do app' do
    visit root_path

    expect(page).to have_content 'Cade Buffet?'
  end
end
