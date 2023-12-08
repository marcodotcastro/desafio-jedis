class BirthdayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    if value > Time.zone.today
      record.errors.add(attribute, 'deve ser uma data no passado')
    elsif options[:max_age] && value <= Time.zone.today - options[:max_age].years
      record.errors.add(attribute,
                        "deve ser menor que #{options[:max_age]} anos atrás")
    end
  end
end
