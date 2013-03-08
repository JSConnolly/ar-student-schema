require_relative '../app/models/teacher'
require 'faker'

module TeachersFaker
  #refactor to pull from actual model?
  @field_names = %w[name email phone]

  def self.fake
    9.times do
      Teacher.create!(name: Faker::Name.name, email: Faker::Internet.email, 
                     phone: Faker::PhoneNumber.phone_number)
    end
  end
end