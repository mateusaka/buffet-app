# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

buffet_owner1 = BuffetOwner.create!(
  name: 'Akali',
  email: 'buffetowner1@email.com',
  password: '123456'
)

buffet_owner2 = BuffetOwner.create!(
  name: 'Riven',
  email: 'buffetowner2@email.com',
  password: '123456'
)

buffet_owner3 = BuffetOwner.create!(
  name: 'Gnar',
  email: 'buffetowner3@email.com',
  password: '123456'
)

client1 = Client.create!(
  name: 'Gragas',
  cpf: 44068367051,
  email: 'client1@email.com',
  password: '123456'
)

client2 = Client.create!(
  name: 'Vayne',
  cpf: 34348146047,
  email: 'client2@email.com',
  password: '123456'
)

client3 = Client.create!(
  name: 'Lulu',
  cpf: 87515581069,
  email: 'client3@email.com',
  password: '123456'
)

buffet1 = Buffet.create!(
  brand_name: 'Delícias do Sabor',
  corporate_name: 'Buffet One Corp',
  cnpj: '85998191000185',
  phone: '(85) 2838-1358',
  email: 'buffet1@email.com',
  address: 'Travessa Sertanópolis',
  district: 'Aleixo',
  state: 'AM',
  city: 'Manaus',
  cep: '69060430',
  description: 'Especializado em culinária brasileira com uma ampla variedade de pratos tradicionais e regionais',
  payment_method: 'PIX, Cartão de Crédito e Cartão de Débito',
  buffet_owner: buffet_owner1
)

buffet2 = Buffet.create!(
  brand_name: 'Elegance Gourmet',
  corporate_name: 'Buffet Two Corp',
  cnpj: '68191964000106',
  phone: '(53) 3569-8723',
  email: 'buffet2@email.com',
  address: 'Rua Arlindo Figueiró',
  district: 'Centro (Marechal Bormann)',
  state: 'SC',
  city: 'Chapecó',
  cep: '89816197',
  description: 'Focado em eventos sofisticados, oferecendo menus personalizados com ingredientes gourmet',
  payment_method: 'PIX e Boleto',
  buffet_owner: buffet_owner2
)

event1 = Event.create!(
  name: 'Casamento Primavera',
  description: 'Casamento ao ar livre com foco em ingredientes sazonais',
  min_quantity: 100,
  max_quantity: 500,
  duration: 240,
  menu: 'Salmão grelhado com molho de limão siciliano e aspargos',
  alcoholic_drink: true,
  party_decoration: false,
  valet_service: false,
  local: 'Evento pode ser realizado tanto no local do contratante como no nosso espaço',
  buffet: buffet1,
  weekend_base_price: 1500,
  weekend_additional_price_person: 200,
  weekend_additional_price_hour: 300
)

event2 = Event.create!(
  name: 'Festa Tropical Delícias do Sabor',
  description: 'Festa temática com um toque tropical',
  min_quantity: 20,
  max_quantity: 1000,
  duration: 60,
  menu: 'Moqueca de peixe com arroz de coco',
  alcoholic_drink: false,
  party_decoration: true,
  valet_service: false,
  local: 'Evento pode ser realizado tanto no local do contratante como no nosso espaço',
  buffet: buffet1,
  weekend_base_price: 500,
  weekend_additional_price_person: 10,
  weekend_additional_price_hour: 100,
  weekday_base_price: 300,
  weekday_additional_price_person: 15,
  weekday_additional_price_hour: 120
)

event3 = Event.create!(
  name: 'Aniversário Infantil Festa Completa',
  description: 'Festa para crianças com opções divertidas e saborosas',
  min_quantity: 5,
  max_quantity: 80,
  duration: 150,
  menu: 'Nuggets de frango com batata frita',
  alcoholic_drink: false,
  party_decoration: true,
  valet_service: true,
  local: 'Evento pode ser realizado tanto no local do contratante como no nosso espaço',
  buffet: buffet2,
  weekend_base_price: 2000,
  weekend_additional_price_person: 50,
  weekend_additional_price_hour: 500,
  weekday_base_price: 3000,
  weekday_additional_price_person: 70,
  weekday_additional_price_hour: 700
)

order1 = Order.create!(
  client: client1,
  buffet: buffet1,
  event: event1,
  date: Date.today.next_occurring(:sunday),
  quantity: 200,
  details: 'Quero o melhor casamento',
  payment_method: 'PIX',
  extra_fee: 200,
  fee_or_discount_reason: 'Devido ao pedido do cliente',
  payment_validity: Date.today,
  status: 1
)

order2 = Order.create!(
  client: client2,
  buffet: buffet1,
  event: event1,
  date: Date.today.next_occurring(:saturday),
  quantity: 200,
  details: 'Preciso de um palácio para o meu casamento'
)

order3 = Order.create!(
  client: client3,
  buffet: buffet1,
  event: event1,
  date: Date.today.next_occurring(:sunday),
  quantity: 200,
  details: 'Se possível realizar a meia noite no bairo Américo',
  payment_method: 'PIX',
  extra_fee: 2600,
  fee_or_discount_reason: 'Proteção contra furtos devido ao local',
  payment_validity: Date.today,
  status: 1
)

order4 = Order.create!(
  client: client2,
  buffet: buffet1,
  event: event2,
  date: Date.today.next_week(:saturday),
  quantity: 200,
  details: 'Festa no caribe',
  payment_method: 'Cartão de Crédito',
  discount: 100,
  fee_or_discount_reason: 'Podemos dar um desconto',
  payment_validity: Date.today,
  status: 1,
  payment_done: true
)

order5 = Order.create!(
  client: client3,
  buffet: buffet2,
  event: event3,
  date: Date.today,
  quantity: 67,
  details: 'Preciso de muita batatinha'
)

order4 = Order.create!(
  client: client2,
  buffet: buffet1,
  event: event2,
  date: 2.days.from_now,
  quantity: 200,
  details: 'Festa no caribe',
  payment_method: 'Cartão de Débito',
  discount: 150,
  fee_or_discount_reason: 'Podemos dar um desconto devido a forma de pagamento',
  payment_validity: 1.day.from_now,
  status: 1,
  payment_done: true
)

order5 = Order.create!(
  client: client1,
  buffet: buffet2,
  event: event3,
  date: 5.days.from_now,
  quantity: 63,
  details: 'Festa de princesa'
)
