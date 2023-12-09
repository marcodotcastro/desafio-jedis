class Senders::Changed < BusinessApplication

  def initialize(citizen)
    @citizen = citizen
  end

  def call
    return unless @citizen.valid? and @citizen.address.valid?
    return unless @citizen.changed? or @citizen.address.changed?

    get_changes
    send_mailer
    send_sms if @citizen.attribute_changed?(:active)
  end

  private

  def get_changes
    @citizen_changes = @citizen.changes
    @address_changes = @citizen.address.changes
    @citizen_changes.delete(:updated_at)
    @address_changes.delete(:updated_at)
  end

  def send_mailer
    CitizenMailer.with(citizen: @citizen, citizen_changes: @citizen_changes, address_changes: @address_changes).changed.deliver_later
  end

  def send_sms
    Api::Sms::Twilio.new.send(@citizen.phone, I18n.t('mailer.citizen.registered.subject', full_name: @citizen.full_name))
  end
end