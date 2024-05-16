require 'rails_helper'

describe 'Dono de buffet vê detalhes do buffet' do
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

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Meu buffet'

    expect(page).not_to have_content 'Cade Buffet?'
    expect(page).to have_content 'ABC omidas'
    expect(page).to have_content 'Buffet ABC'
    expect(page).to have_content '112233-4444'
    expect(page).to have_content '(81) 987658866'
    expect(page).to have_content 'abc@buffet.com'
    expect(page).to have_content 'Avenida das comidas'
    expect(page).to have_content 'Macaxeira'
    expect(page).to have_content 'Jaboatão'
    expect(page).to have_content 'Pernambuco'
    expect(page).to have_content '52050-333'
    expect(page).to have_content 'Um buffet que cobra por prato quebrado'
    expect(page).to have_content 'PIX'
  end

  it 'e volta para tela inicial' do
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

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    click_on 'Meu buffet'
    click_on 'Home'

    expect(current_path).to eq(root_path)
    expect(page).to have_content 'Cade Buffet?'
    expect(page).not_to have_content 'ABC omidas'
    expect(page).not_to have_content 'Buffet ABC'
    expect(page).not_to have_content '112233-4444'
    expect(page).not_to have_content '(81) 987658866'
    expect(page).not_to have_content 'abc@buffet.com'
    expect(page).not_to have_content 'Avenida das comidas'
    expect(page).not_to have_content 'Macaxeira'
    expect(page).not_to have_content 'Jaboatão'
    expect(page).not_to have_content 'Pernambuco'
    expect(page).not_to have_content '52050-333'
    expect(page).not_to have_content 'Um buffet que cobra por prato quebrado'
    expect(page).not_to have_content 'PIX'
  end

  it 'e tenta acessar o detalhes de outro dono de buffet' do
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

    login_as(buffet_owner, scope: :buffet_owner)
    visit root_path
    visit buffet_path(second_buffet)

    expect(page).not_to have_content 'Le Buffet'
    expect(page).to have_content 'Ocorreu um erro'
    expect(page).to have_content 'Acesso não autorizado!'
  end
end
