require_relative '../../db/config'

class Student
  def initialize(args = {})
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = args[:gender]
    @birthday = args[:birthday]
  end

  def assign_attributes(args)
    @first_name = args[:first_name] || @first_name
    @last_name = args[:last_name] || @last_name
    @gender = args[:gender] || @gender
    @birthday = args[:birthday] || @birthday

  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def delete_students
  end

end

# student = Student.new
# student.assign_attributes(
#                           :first_name => "Happy",
#                           :last_name => "Gilmore",
#                           :gender => 'male',
#                           :birthday => Date.new(1970,9,1)
#     )

# puts student.name