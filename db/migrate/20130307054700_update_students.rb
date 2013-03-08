require_relative '../config'

class UpdateStudents < ActiveRecord::Migration
  def up
    change_table :students do |t|
      t.integer :teacher_id
    end
  end

  def down
    change_table :students do |t|
      t.remove(:teacher_id)
    end
  end
end