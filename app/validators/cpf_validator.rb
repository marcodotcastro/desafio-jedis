class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if valid_cpf?(value)

    record.errors.add(attribute, 'não é um CPF válido')
  end

  private

  def valid_cpf?(cpf)
    cpf = cpf.to_s.gsub(/[^\d]/, '')
    return false if cpf.length != 11 || cpf.chars.uniq.length == 1

    first_verifier, second_verifier = calculate_verifiers(cpf)

    cpf[-2, 2] == "#{first_verifier}#{second_verifier}"
  end

  def calculate_verifiers(cpf)
    digits = cpf.chars.map(&:to_i)

    first_verifier = calculate_digit(digits, 10)
    second_verifier = calculate_digit(digits, 11)

    [first_verifier, second_verifier]
  end

  def calculate_digit(digits, length)
    sum = digits.first(length - 1).each_with_index.sum do |digit, index|
      digit * (length - index)
    end

    mod = sum % 11
    mod < 2 ? 0 : 11 - mod
  end
end
