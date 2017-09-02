require 'twilio-ruby'

class TwilioService

  account_sid = ""
  auth_token = "test auth token"

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => '+13157571027',
    :to => '+16073426730',
    :body => 'This is a test'
    })

end
