class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^\d?\-?\(?\d{3}\)?(-|\.|\s)?\d{3}(\)|-|\.|\s)?\d{4}(\)|-|\.|\s)?\s?(x\s?\d+)?$/i
      record.errors[attribute] << (options[:message] || "is not a valid phone: #{value}")
    end
  end
end
