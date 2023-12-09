class Senders::Registered < BusinessApplication

  def initialize(citizen)
    @citizen = citizen
  end

  def call
    send_mailer
    send_sms
  end

  private

  def send_mailer
    CitizenMailer.with(citizen: @citizen).registered.deliver_later
  end

  def send_sms
    Api::Sms::Twilio.new.send(@citizen.phone, I18n.t('mailer.citizen.registered.subject', full_name: @citizen.full_name))
  end

end