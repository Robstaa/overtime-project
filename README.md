# Overtime tracking application
Creating an app to keep track of overtime for hypothetical use of a company
Employees can log overtime and admins can approve
App is created with tests

##Try it out
- To take a look at the app, login as admin and play around with the functions
- Admin: (email: admin@enterprise-overtime-app.herokuapp.com, PW: 123456)
- User: (email: user@enterprise-overtime-app.herokuapp.com, PW: 123456)
- Here is the live website: https://enterprise-overtime-app.herokuapp.com/ - you may have to wait 20 secs for the Heroku server to start up

## To create that app a few gems and frameworks have been used:
- Devise (User authentification)
- Administrate (Admin Dashboard)
- Bootstrap (Basic design)
- Font awesome rails (Icons)
- Kamniari (Pagination)
- Gritter (Notifications)
- Dotenv (Protect credentials)
- Faker (Seeds)
- Rspec (Testing)
- Capybara (Integration testing)
- Pry-byebug/Binding of caller/Better errors (debugging)

## Implemented Live Application features
- Tasks are timely executed with Heroku Scheduler
- Sends weekly SMS (Twilio) to users to approve their week's overtime log
- Sends daily overtime update E-Mail (Sparkpost & Rails Mailer) to manager if employees logged overtime

## TODO
- Find a solution to fix the capybara click_button bug
- x Refactor hardcoded "AdminUser" with an instance method in a controller
- Make the whole row clickable on the index page to get to the show page (needs JS)
- x Fix pagination on admin dashboard
- x Edit has to have status options for admins
- x Fix login bug (message "approved" comes, but still in sign in window)
- Improve seed file
- Mobile responsiveness for navbar
- Delete hr tag in account window in navbar for employee
#
Following the best practice of application building by Jordan Hudgens
