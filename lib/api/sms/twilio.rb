require 'twilio-ruby'

class Api::Sms::Twilio

  def send(to, body)
    return 'not_twilio_account' if ENV['TWILIO_ACCOUNT_SID'].blank?
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    message = client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+#{to}",
      body: body
    )

    message.status
  end
end