class CnsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if cns_valid?(value) || cns_provisional_valid?(value)

    record.errors.add(attribute, 'não é um CNS válido')
  end

  private

  def cns_valid?(cns)
    cns == generate_pattern(cns, 0..10)
  end

  def cns_provisional_valid?(cns)
    (sum_cns(cns) % 11).zero?
  end

  def sum_cns(cns, target = 1..15)
    target.to_a.reverse.sum { |n| cns.to_s[15 - n].to_i * n }
  end

  def generate_pattern(cns, number_range)
    cns_pattern = sum_cns(cns, 5..15)
    verifier = calculate_verifier(cns_pattern)

    number = cns.to_s[number_range]
    if verifier == 10
      "#{number}001#{calculate_verifier(2)}"
    else
      "#{number}000#{verifier}"
    end
  end

  def calculate_verifier(cns_pattern)
    value = 11 - (cns_pattern % 11)
    value == 11 ? 0 : value
  end
end
