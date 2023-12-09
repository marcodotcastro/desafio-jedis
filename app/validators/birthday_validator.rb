class BirthdayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    if value > Time.zone.today
      record.errors.add(attribute, 'deve ser uma data no passado')
    elsif check_max_age(value)
      record.errors.add(attribute,
                        "deve ser menor que #{options[:max_age]} anos atrás")
    end
  end

  private

  def check_max_age(value)
    options[:max_age] && value <= Time.zone.today - options[:max_age].years
  end
end
