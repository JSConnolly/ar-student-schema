require 'active_record'
require_relative '../app/validators/email_validator.rb'
require_relative '../app/validators/phone_validator.rb'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-students.sqlite3")

