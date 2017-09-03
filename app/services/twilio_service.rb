require 'twilio-ruby'
require 'pry'

account_sid = "#{ENV['twilio_sid']}"
auth_token = "#{ENV['twilio_test_token']}"

  # @client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_test_token']
  @client = Twilio::REST::Client.new account_sid, auth_token

  # binding.pry
  @message = @client.messages.create({
    to: '+16073426730',
    from: "+15005550006",
    body: 'This is sent from your twilio_service.rb file'
    })
