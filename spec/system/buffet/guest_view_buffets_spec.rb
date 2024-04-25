require 'rails_helper'

describe 'Visitante vê a lista de todos os buffets' do
  it 'a partir da tela inicial' do
    buffet_owner = BuffetOwner.create!(
      name: 'Mateus Buffet Owner',
      email: 'mateus@gmail.com',
      password: '123456'
    )

    buffet = Buffet.create!(
      brand_name: 'ABC omidas',
      corporate_name: 'Buffet ABC',
      cnpj: '112233-4444',
      phone: '(81) 987658866',
      email: 'abc@buffet.com',
      address: 'Avenida das comidas',
      district: 'Macaxeira',
      state: 'Pernambuco',
      city: 'Jaboatão',
      cep: '52050-333',
      description: 'Um buffet que cobra por prato quebrado',
      payment_method: 'PIX',
      buffet_owner: buffet_owner
    )

    second_buffet_owner = BuffetOwner.create!(
      name: 'Lucas Buffet Owner',
      email: 'lucas@gmail.com',
      password: '123456'
    )

    second_buffet = Buffet.create!(
      brand_name: 'Le Buffet',
      corporate_name: 'Food Corp',
      cnpj: '33-55',
      phone: '(81) 987658866',
      email: 'lebuff@buffet.com',
      address: 'Avenida das foods',
      district: 'Mandioca',
      state: 'Rio Grande do Norte',
      city: 'Natal',
      cep: '76050-111',
      description: 'Um buffet que cobra por prato quebrado',
      payment_method: 'Cartão',
      buffet_owner: second_buffet_owner
    )

    visit root_path

    expect(page).not_to have_content 'Não há buffets disponíveis'
    expect(page).to have_content 'ABC omidas | Jaboatão - Pernambuco'
    expect(page).to have_content 'Le Buffet | Natal - Rio Grande do Norte'
  end

  it 'e volta para a tela inicial' do
    buffet_owner = BuffetOwner.create!(
      name: 'Mateus Buffet Owner',
      email: 'mateus@gmail.com',
      password: '123456'
    )

    buffet = Buffet.create!(
      brand_name: 'ABC omidas',
      corporate_name: 'Buffet ABC',
      cnpj: '112233-4444',
      phone: '(81) 987658866',
      email: 'abc@buffet.com',
      address: 'Avenida das comidas',
      district: 'Macaxeira',
      state: 'Pernambuco',
      city: 'Jaboatão',
      cep: '52050-333',
      description: 'Um buffet que cobra por prato quebrado',
      payment_method: 'PIX',
      buffet_owner: buffet_owner
    )

    second_buffet_owner = BuffetOwner.create!(
      name: 'Lucas Buffet Owner',
      email: 'lucas@gmail.com',
      password: '123456'
    )

    second_buffet = Buffet.create!(
      brand_name: 'Le Buffet',
      corporate_name: 'Food Corp',
      cnpj: '33-55',
      phone: '(81) 987658866',
      email: 'lebuff@buffet.com',
      address: 'Avenida das foods',
      district: 'Mandioca',
      state: 'Rio Grande do Norte',
      city: 'Natal',
      cep: '76050-111',
      description: 'Um buffet que cobra por prato quebrado',
      payment_method: 'Cartão',
      buffet_owner: second_buffet_owner
    )

    visit root_path
    click_on 'Home'

    expect(page).to have_content 'ABC omidas | Jaboatão - Pernambuco'
    expect(page).to have_content 'Le Buffet | Natal - Rio Grande do Norte'
    expect(page).to have_content 'Cade Buffet?'
  end

  it 'e não tem nenhum cadastrado' do
    visit root_path

    expect(page).to have_content 'Não há buffets disponíveis'
  end
end
