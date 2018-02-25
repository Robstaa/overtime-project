# Overtime tracking application
Creating an app to keep track of overtime for a whole team including admin functions
App is created in TDD environment

## To create that app a few gems and frameworks are going to be used:
- Devise (User authentification)
- Administrate (Admin Dashboard)
- Bootstrap (Basic design)
- Twilio (SMS messages)
- Dotenv (Protect credentials)
- Rspec (Testing)
- Capybara (Integration testing)

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
