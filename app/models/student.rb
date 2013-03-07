require_relative '../../db/config'

class Student < ActiveRecord::Base
  # def initialize(args = {})
  #   @first_name = args[:first_name]
  #   @last_name = args[:last_name]
  #   @gender = args[:gender]
  #   @birthday = args[:birthday]
  # end

  # has_one :first_name
  # has_one :last_name
  # has_one :gender

  # def assign_attributes(args)
  #   @first_name = args[:first_name] || @first_name
  #   @last_name = args[:last_name] || @last_name
  #   @gender = args[:gender] || @gender
  #   @birthday = args[:birthday] || @birthday

  # end

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    
    now.year - birthday.year - ((now.month > birthday.month ||
    (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def self.delete_all
    Student.destroy_all
  end

end

# Student.delete_all
# student = Student.new
# student.assign_attributes(
#                           :first_name => "Happy",
#                           :last_name => "Gilmore",
#                           :gender => 'male',
#                           :birthday => Date.new(1970,9,1)
#     )
# student.save

# puts student.name