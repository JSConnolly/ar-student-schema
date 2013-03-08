require_relative '../config'

class CreateTeachers < ActiveRecord::Migration
  def up
    puts "adding table"
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
    end

  end

  def down
    drop_table :students
  end
end