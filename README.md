# Overtime tracking application
Creating an app to keep track of overtime for a whole team including admin functions
App is created in TDD environment

##Try it out
- To take a look at the app, login as admin or user
- User: (email: test@test.com, PW: 123456)
- Admin: (email: admin@test.com, PW: 123456)
- Here is the live website: https://enterprise-overtime-app.herokuapp.com/

## To create that app a few gems and frameworks have been used:
- Devise (User authentification)
- Administrate (Admin Dashboard)
- Bootstrap (Basic design)
- Twilio (SMS messages)
- Dotenv (Protect credentials)
- Rspec (Testing)
- Capybara (Integration testing)

## Live Application features
- Sends regularly SMS (Twilio) and E-Mails (Sparkpost) to users - executed with Heroku Scheduler


## TODO
- Find a solution to fix the capybara click_button bug
- Refactor hardcoded "AdminUser" with an instance method in a controller
- Make the whole row clickable on the index page to get to the show page (needs JS)
- Fix pagination on admin dashboard
- Edit has to have status options for admins
- Fix login bug (message "approved" comes, but still in sign in window)
- Improve seed file
#
Following the best practice of application building by Jordan Hudgens
