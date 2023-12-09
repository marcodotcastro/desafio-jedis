class CitizenMailer < ApplicationMailer
  def registered
    @citizen = params[:citizen]
    mail(to: @citizen.email,
         subject: t('mailer.citizen.registered.subject',
                    full_name: @citizen.full_name))
  end

  def changed
    @citizen = params[:citizen]
    @citizen_changes = params[:citizen_changes]
    @address_changes = params[:address_changes]
    mail(to: @citizen.email,
         subject: t('mailer.citizen.changed.subject',
                    full_name: @citizen.full_name))
  end
end
