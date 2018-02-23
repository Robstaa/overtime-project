namespace :notification do
  desc "Send SMS notification to employees asking them to log overtime"
  task sms: :environment do
    #1. Schedule to run on Sunday at 5PM --> Heroku
    #2. Iterate over all employees
    #3. Skip admin users
    #4. Send a message that has instructions and a link to log time
    #5. Link content has to be mobile responsive
  end
end
