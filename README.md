
### App for managing cinema ticket booking.

Functional requirements:
- [ ] Endpoint to buy tickets/create reservation from ticket desk
- [ ] Endpoint to buy tickets/create reservation from online application
- [ ] There should be mechanism (Cronjob? Background job?) to terminate reservation if somebody did not pay ~30 minutes before screening (for reservations created by online application)
- [ ] There should be email communication provided:
- [ ] When reservation is created (tickets, seats and price should be attached)
- [ ] When reservation is terminated (the reason should be attached)
- [ ] Creating reservation should be robust and there should be validations (for instance - for already taken seats etc., consider edge cases). 
- [ ] Application should have implemented authentication (there should be logging by user and by employer)
- [ ] Application should have authorization in terms of role-based separation
- [ ] Regular user should have ability to create only online reservation
- [ ] Employer should have ability to create online reservation but also offline reservation

Not functional requirements:
- [ ] API should be documented 
- [ ] Application should have provided seeds and should be generally operational
- [ ] At least 80% of tests coverage
- [ ] Application should have connected Sentry and CircleCI
- [ ] Application should be accessible publicly (for instance by Heroku)
- [ ] Application should have configured rubocop and should fulfill all rubocop requirements.

Nice to have:
- [ ] JSON:API endpoint
- [ ] GraphQL endpoint
- [ ] File upload (for instance avatar for user?)
- [ ] Other functionalities like adding new movies, screenings, cinema halls

ruby : 2.7.3p183

Rails : 6.1.3.2

Database : Postgresql

Test : Rspec
