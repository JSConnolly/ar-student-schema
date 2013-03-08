require_relative '../../db/config'

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

