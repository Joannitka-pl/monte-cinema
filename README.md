Functional requirements:

- [x] Endpoint to buy tickets/create reservation from ticket desk
- [x] Endpoint to buy tickets/create reservation from online application
- [x] There should be mechanism (Cronjob? Background job?) to terminate reservation if somebody did not pay ~30 minutes before screening (for reservations created by online application)
 There should be email communication provided:
- [x] When reservation is created (tickets, seats and price should be attached)
- [ ] When reservation is terminated (the reason should be attached)
- [x] Creating reservation should be robust and there should be validations (for instance - for already taken seats etc., consider edge cases). 
- [x] Application should have implemented authentication (there should be logging by user and by employer)
- [x] Application should have authorization in terms of role-based separation
- [x] Regular user should have ability to create only online reservation
- [x] Employer should have ability to create online reservation but also offline reservation

Not functional requirements:
- [ ] API should be documented 
- [x] Application should have provided seeds and should be generally operational
- [x] At least 80% of tests coverage
- [x] Application should have connected Sentry 
- [ ] Application should have connected CircleCI
- [ ] Application should be accessible publicly (for instance by Heroku)
- [x] Application should have configured rubocop 
- [ ] Application should fulfill all rubocop requirements.

Nice to have:
- [ ] JSON:API endpoint
- [ ] GraphQL endpoint
- [ ] File upload (for instance avatar for user?)
- [ ] Other functionalities like adding new movies, screenings, cinema halls

ruby : 2.7.3p183

Rails : 6.1.3.2

Database : Postgresql

Test : Rspec

Next to dos:
1. Refactor seat to be a separate model or included in ticket model. This way it would have 1:1 relation with reservation, what would allow easier access to it. It would also allow proper seat validations. In current state it is possible to mismatch reservation seat uniqness of [a1, a2, a3] with [a3, a2, a1] as 2 different reservations. In current model state proper handling of seat would require the code to become very complicated and didn't want to proceed with this approach.
2. Hving more time I would also implement better handling of cancelled reservations to change their status perhaps using singleton method.
3. Due to insuficient time I wanted to focus on additional functions like: async job, mailer, authentication and authorization hence there are tasks to do like: 
- handling rescue errors
- Circle CI implementation
- deployment to Heroku
- fulfilling some Rubocop requirements
- creating API documentation (configured and started)
