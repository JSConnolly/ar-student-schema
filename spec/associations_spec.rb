require 'rspec'
require 'faker'
require_relative '../app/models/teacher'
require_relative '../app/models/student'

describe 'teacher associations' do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
    Student.delete_all

    @teacher = Teacher.new
    @teacher.assign_attributes(
      :name => "Jesse James",
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567')
    @teacher.save
    @student = Student.new
    @student.assign_attributes(
      :first_name => "Happy",
      :last_name => "Gilmore",
      :gender => 'male',
      :birthday => Date.new(1970,9,1),
      :teacher_id => @teacher.id
    )
    @student.save
    4.times do
      Student.create(
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :gender => ['female', 'male'].sample,
        :birthday => Date.new(1987,4,24),
        :teacher_id => @teacher.id           )
    end
  end

  it "should include happy gilmore" do
    @teacher.students.where(":first_name = ?", 'Happy').should_not be nil
  end

  it "should have 5 students" do
    @teacher.students.count
  end

  it "should point back to the teacher" do
    expect(@student.teacher).to eq(@teacher)
  end



  after(:all) do
      system 'rake db:populate'
  end
end