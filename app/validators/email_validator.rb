class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ URI::MailTo::EMAIL_REGEXP

    record.errors.add(attribute, 'não é um e-mail válido')
  end
end
