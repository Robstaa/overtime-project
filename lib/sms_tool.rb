module SmsTool
  def self.send_sms(number:, message:)
    puts "Sending Sms"
    puts "#{message} to #{number}"
  end
end
