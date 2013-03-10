require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  validates :email, :email => true, :uniqueness => true
  validates :phone, :phone => true

  has_many :students

  def self.delete_all
    Teacher.destroy_all
  end
end