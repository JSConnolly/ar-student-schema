require 'rspec'
require_relative '../app/models/teacher'
require_relative '../app/models/student'

describe Teacher do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
    Student.delete_all
  end

  before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      :name => "Jesse James",
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567')
  end

  describe "#delete_all" do
    it "should empty the database" do
      @teacher.save

      Teacher.first should_not be nil
      Teacher.delete_all
      Teacher.first.should be nil
    end
  end

  describe "basic validations" do
    

    it "should accept valid info" do
      @teacher.should be_valid
    end

    it "shouldn't accept invalid emails" do
      ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
        @teacher.assign_attributes(:email => address)
        @teacher.should_not be_valid
      end
    end

    it "should accept valid emails" do
      ["joe@example.com", "info@bbc.co.uk", "bugs@devbootcamp.com"].each do |address|
        @teacher.assign_attributes(:email => address)
        @teacher.should be_valid
      end
    end

    it "shouldn't allow two teachers with the same email" do
      another_teacher = Teacher.create!(
        :email => @teacher.email,
        :phone => @teacher.phone)
      @teacher.should_not be_valid
      Teacher.delete_all
    end
  end


  describe "advanced validations" do

    it "should accept valid info" do
      @teacher.should be_valid
    end

    it "shouldn't accept invalid phone numbers" do
      @teacher.assign_attributes(:phone => '347-8901')
      @teacher.should_not be_valid
    end
  end

  after(:all) do
      system 'rake db:populate'
  end
end