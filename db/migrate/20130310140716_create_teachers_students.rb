require_relative '../config'

class CreateStudentsTeachers < ActiveRecord::Migration
  def up
    puts "adding table students_teachers"
    create_join_table :students, teachers
  end

  def down
    drop_table :students_teachers
  end
end