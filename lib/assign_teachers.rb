require_relative '../app/models/teacher'
require_relative '../app/models/student'

module AssignTeachers
  def self.randomly_distribute
    teacher_indices = Teacher.select(:id).map {|teacher| teacher.id}
    p teacher_indices
    Student.find_each do |student|
      student.assign_attributes( teacher_id: teacher_indices.sample )
      student.save
    end
  end
  
end