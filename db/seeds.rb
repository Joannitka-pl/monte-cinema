# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Hall.destroy_all
Movie.destroy_all
Seance.destroy_all
Client.destroy_all
TicketDesk.destroy_all
Reservation.destroy_all
Ticket.destroy_all

hall_1 = Hall.create!(id: 1, number: 1, capacity: 200)
hall_2 = Hall.create!(id: 2, number: 2, capacity: 100)
hall_3 = Hall.create!(id: 3, number: 3, capacity: 50)

movie_1 = Movie.create!(id: 11, title: 'Matrix', age_limit: 18, duration: 160)
movie_2 = Movie.create!(id: 12, title: 'Titanic', age_limit: 10, duration: 90)
movie_3 = Movie.create!(id: 13, title: 'Shrek', age_limit: 10, duration: 100)

seance_1 = Seance.create!(id: 1, date: '2021-07-11 20:40:00', hall_id: hall_1.id, movie_id: movie_1.id)
seance_2 = Seance.create!(id: 2, date: '2021-07-11 10:00:00', hall_id: hall_2.id, movie_id: movie_2.id)
seance_3 = Seance.create!(id: 3, date: '2021-07-11 12:30:00', hall_id: hall_3.id, movie_id: movie_3.id)

client_1 = Client.create!(id: 1, name: 'Joanna Kowal', email: 'joannakowal@mail.com', age: 20, real_user: false)
client_2 = Client.create!(id: 2, name: 'Anna Nowak', email: 'annanowak@mail.com', age: 21, real_user: true)
client_3 = Client.create!(id: 3, name: ' Piotr Cybulski', email: 'piotrcybulski@mail.com', age: 12, real_user: false)

ticket_desk_1 = TicketDesk.create!(id: 1, category: 'offline', number: 1)
ticket_desk_2 = TicketDesk.create!(id: 2, category: 'online', number: 0)

reservation_1 = Reservation.create!(id: 1, status: 'confirmed', seance_id: seance_1.id,
                                    ticket_desk_id: ticket_desk_1.id, client_id: client_1.id, user_id: 1)
reservation_2 = Reservation.create!(id: 2, status: 'confirmed', seance_id: seance_2.id,
                                    ticket_desk_id: ticket_desk_2.id, client_id: client_2.id, user_id: 1)
reservation_3 = Reservation.create!(id: 3, status: 'canceled', seance_id: seance_3.id,
                                    ticket_desk_id: ticket_desk_1.id, client_id: client_3.id, user_id: 2)

Ticket.create!(id: 1, sort: 'regular', price: 20, reservation_id: reservation_1.id, seat: 'A1', key: 'ais73ueir902n.kd')
Ticket.create!(id: 2, sort: 'regular', price: 20, reservation_id: reservation_2.id, seat: 'A2', key: 'gjfy27308ksuqisk')
Ticket.create!(id: 3, sort: 'regular', price: 20, reservation_id: reservation_3.id, seat: 'A3', key: '4-ske,ci-=wlr9sx')
