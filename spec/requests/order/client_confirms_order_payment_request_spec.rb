require 'rails_helper'

describe 'Cliente acessa a página de pagamento do pedido' do
  it 'e tenta pagar o pedido de outro usuário' do
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

    event = Event.create!(
      name: 'Super Evento',
      description: 'Super descrição',
      min_quantity: 10,
      max_quantity: 20,
      duration: 60,
      menu: 'Lagosta',
      alcoholic_drink: true,
      party_decoration: false,
      valet_service: false,
      local: 'Local do contratante',
      buffet: buffet,
      weekend_base_price: 120,
      weekend_additional_price_person: 50,
      weekend_additional_price_hour: 30
    )

    client = Client.create!(
      name: 'Mateus Cliente',
      cpf: '10365025038',
      email: 'mateus@cliente.com',
      password: '123456'
    )

    order = Order.create!(
      client: client,
      buffet: buffet,
      event: event,
      date: weekend_date,
      quantity: 15,
      details: 'Mais detalhes do pedido'
    )

    second_client = Client.create!(
      name: 'Mateus2 Cliente',
      cpf: '53216174654',
      email: 'mateus2@cliente.com',
      password: '123456'
    )

    second_order = Order.create!(
      client: second_client,
      buffet: buffet,
      event: event,
      date: weekend_date,
      quantity: 19,
      details: 'Mais detalhes do segundo pedido'
    )

    login_as(client, scope: :client)
    post(payment_order_path(second_order))

    expect(response).to redirect_to(unauthorized_path)
  end
end
