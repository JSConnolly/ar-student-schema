require_relative '../../db/config'


class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^\(?\d{3}\)?(-|\.|\s)?\d{3}(\)|-|\.|\s)?\d{4}(\)|-|\.|\s)?\s?(x\s?\d+)?$/i
      record.errors[attribute] << (options[:message] || "is not a valid phone")
    end
  end
end



class Student < ActiveRecord::Base
  validates :email, :email => true, :uniqueness => true
  validates :phone, :phone => true
  validate :age_greater_than_5

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    
    now.year - birthday.year - ((now.month > birthday.month ||
    (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def age_greater_than_5
    if age < 5
      errors.add(:age, "can't be less than 5")
    end
  end

  def self.delete_all
    Student.destroy_all
  end

end

