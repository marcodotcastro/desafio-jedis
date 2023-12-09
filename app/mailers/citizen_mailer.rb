class CitizenMailer < ApplicationMailer

  def registered
    @citizen = params[:citizen]
    mail(to: @citizen.email, subject: t('mailer.citizen.registered.subject', full_name: @citizen.full_name))
  end
end
