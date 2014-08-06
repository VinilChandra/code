 require 'spec_helper'

describe Recruiter do
 it "has a valid factory" do
 expect(build(:recruiter)).to be_valid
 end

 it "is invalid without matching password and password confirmation"do
 recruiter = Recruiter.new(
      name: 'paramesh',
      email: 'tester@example.com',
      password: 'orange',
      password_confirmation: 'orang',
      phone: '8500209136',
      companyaddr: 'film nagar',
      companyname: 'Techsophy'
      
      )
      expect(recruiter).to_not be_valid
end
 it "is invalid without a name" do
    expect(build(:recruiter, name: nil)).to \
      have(1).errors_on(:name)
 end
  it "is invalid without a company_name" do
    expect(build(:recruiter, companyname: nil)).to \
      have(1).errors_on(:companyname)
 end

 it "is invalid without a phone"do
    expect(build(:recruiter, phone: nil)).to \
      have(2).errors_on(:phone)
 end
 it "phone is invalid violating numericality" do
    expect(build(:recruiter, phone: '850020k13')).to \
      have(1).errors_on(:phone)
 end

 it "is invalid without an email address"do
  expect(build(:recruiter, email: nil)).to \
      have(2).errors_on(:email)
 end
 it "is invalid with a duplicate email address"do
    create(:recruiter, email: "aaron@example.com")
seconduser = build(:recruiter, email: "aaron@example.com")
expect(seconduser).to have(1).errors_on(:email)
 end
 it "is invalid without invalid email address"do
    expect(build(:recruiter, email: 'testerexample.com')).to \
      have(1).errors_on(:email)
 end
end
