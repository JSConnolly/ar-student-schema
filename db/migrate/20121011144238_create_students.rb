require_relative '../config'

class CreateStudents < ActiveRecord::Migration
  def up
    puts "adding table"
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone

    end

  end

  def down
    drop_table :students
  end
end

