require_relative '../config'

class CreateStudentsTeachers < ActiveRecord::Migration
  def up
    puts "adding table students_teachers"
    create_table :students_teachers, :id => false do |t|
      t.integer :student_id
      t.integer :teacher_id
    end
  end

  def down
    drop_table :students_teachers
  end
end