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

hall_1 = Hall.create!(number: 1, capacity: 200)
hall_2 = Hall.create!(number: 2, capacity: 100)
hall_3 = Hall.create!(number: 3, capacity: 50)

movie_1 = Movie.create!(title: 'Matrix', age_limit: 18, duration: 160)
movie_2 = Movie.create!(title: 'Titanic', age_limit: 10, duration: 90)
movie_3 = Movie.create!(title: 'Shrek', age_limit: 10, duration: 100)

seance_1 = Seance.create!(date: '2021-07-11 20:40:00', hall_id: hall_1.id, movie_id: movie_1.id)
seance_2 = Seance.create!(date: '2021-07-11 10:00:00', hall_id: hall_2.id, movie_id: movie_2.id)
seance_3 = Seance.create!(date: '2021-07-11 12:30:00', hall_id: hall_3.id, movie_id: movie_3.id)

client_1 = Client.create!(name: 'Joanna Kowal', email: 'joannakowal@mail.com', age: 20, real_user: false)
client_2 = Client.create!(name: 'Anna Nowak', email: 'annanowak@mail.com', age: 21, real_user: true)
client_3 = Client.create!(name: ' Piotr Cybulski', email: 'piotrcybulski@mail.com', age: 12, real_user: false)

ticket_desk_1 = TicketDesk.create!(category: 'offline', number: 1)
ticket_desk_2 = TicketDesk.create!(category: 'online', number: 0)

ticket_1 = Ticket.new(sort: 'regular', price: 20, seat: 'A1', key: 'ais73ueir902n.kd')
ticket_2 = Ticket.new(sort: 'regular', price: 20, seat: 'A2', key: 'gjfy27308ksuqisk')
ticket_3 = Ticket.new(sort: 'regular', price: 20, seat: 'A3', key: '4-ske,ci-=wlr9sx')

Reservation.create!(status: 'confirmed', seance_id: seance_1.id,
                    ticket_desk_id: ticket_desk_1.id, client_id: client_1.id,
                    tickets: [ticket_1])
Reservation.create!(status: 'confirmed', seance_id: seance_2.id,
                    ticket_desk_id: ticket_desk_2.id, client_id: client_2.id,
                    tickets: [ticket_1, ticket_2])
Reservation.create!(status: 'canceled', seance_id: seance_3.id,
                    ticket_desk_id: ticket_desk_1.id, client_id: client_3.id,
                    tickets: [ticket_1, ticket_2, ticket_3])
