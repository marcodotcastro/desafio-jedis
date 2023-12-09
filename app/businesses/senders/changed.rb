class Senders::Changed < BusinessApplication

  def initialize(citizen)
    @citizen = citizen
  end

  def call
    return unless @citizen.valid?

    get_changes
    send_mailer
  end

  private

  def get_changes
    return unless @citizen.changed?

    @changes = @citizen.changes
    @changes.delete(:updated_at)
  end

  def send_mailer
    CitizenMailer.with(citizen: @citizen, changes: @changes).changed.deliver_later
  end
end