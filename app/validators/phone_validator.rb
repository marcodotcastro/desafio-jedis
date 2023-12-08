class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid_phone_number?(value)
      record.errors.add(attribute, 'não é um telefone válido')
    end
  end

  private

  def valid_phone_number?(phone)
    phone.to_s.match?(/^\d{12,13}$/)
  end
end
