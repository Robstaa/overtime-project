namespace :notification do
  desc "Send SMS notification to employees asking them to log overtime"
  task sms: :environment do
    #1. Schedule to run on Sunday at 5PM --> Heroku
    #2. Iterate over all employees
    #3. Skip admin users
    #4. Send a message that has instructions and a link to log time
    #5. Link content has to be mobile responsive
  end

  desc "Send email to manager each day to inform them about overtime requests"
  task manager_email: :environment do
    #1. Iterate over all posts
    #2. check if there are any with status submitted
    #3. Iterate over list of admins/ managers
    #4. Send email to them if there are any open posts
    admin_users = AdminUser.all
    if Post.submitted.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
