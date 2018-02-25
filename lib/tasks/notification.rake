namespace :notification do
  desc "Send SMS notification to employees asking them to log overtime"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please login the overtime dashboard to request overtime or confirm your hours: https://enterprise-overtime-app.herokuapp.com/"
      employees.each do |employee|
        AuditLog.create!(user_id: employee.id)
        SmsTool.send_sms(employee.phone_number, notification_message)
      end
    end
  end

  desc "Send email to manager each day to inform them about overtime requests"
  task manager_email: :environment do
    admin_users = AdminUser.all
    if Post.submitted.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
    puts "Email sent"
  end
end
