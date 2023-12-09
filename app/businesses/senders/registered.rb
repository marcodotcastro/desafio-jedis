class Senders::Registered < BusinessApplication

  def initialize(citizen)
    @citizen = citizen
  end

  def call
    send_mailer
  end

  private

  def send_mailer
    CitizenMailer.with(citizen: @citizen).registered.deliver_later
  end

end