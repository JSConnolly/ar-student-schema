require_relative '../config'

puts 'running migrate script...'
# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def up
    puts "adding table"
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone

      t.timestamps
    end

  end

  def down
    drop_table :students
  end
end

