module SmsTool
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  def self.send_sms(number, message)
    @client.api.account.messages.create(
      from: "+4915735994341",
      to: "#{number}",
      body: "#{message}")
  end
end

# SmsTool.send_sms("+4917661387174", "ONE MORE TRY ;)")
