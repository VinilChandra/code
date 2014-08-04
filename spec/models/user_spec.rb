 require 'spec_helper'

describe User do
 it "has a valid factory" do
 expect(build(:user)).to be_valid
 end

 it "is invalid without matching password and password confirmation"do
 user = User.new(
      name: 'paramesh',
      email: 'tester@example.com',
      password: 'orange',
      password_confirmation: 'orang',
      phone: '8500209136',
      address: 'film nagar',
      state: 'telangana',
      dist: 'rangareddy',
      citytown: 'hyderabad',
      mandal: 'jubilee hills',
      )
      expect(user).to_not be_valid
end
 it "is invalid without a name" do
    expect(build(:user, name: nil)).to \
      have(1).errors_on(:name)
 end
 it "is invalid without a state"do
   expect(build(:user, state: nil)).to \
      have(1).errors_on(:state)
 end
 it "is invalid without a dist" do
   expect(build(:user, dist: nil)).to \
      have(1).errors_on(:dist)
 end
 it "is invalid without a citytown" do
  expect(build(:user, citytown: nil)).to \
      have(1).errors_on(:citytown)
 end
 it "is invalid without a phone"do
    expect(build(:user, phone: nil)).to \
      have(2).errors_on(:phone)
 end
 it "phone is invalid violating numericality" do
    expect(build(:user, phone: '850020k13')).to \
      have(1).errors_on(:phone)
 end

 it "is invalid without an email address"do
  expect(build(:user, email: nil)).to \
      have(2).errors_on(:email)
 end
 it "is invalid with a duplicate email address"do
    create(:user, email: "aaron@example.com")
seconduser = build(:user, email: "aaron@example.com")
expect(seconduser).to have(1).errors_on(:email)
 end
 it "is invalid without invalid email address"do
    expect(build(:user, email: 'testerexample.com')).to \
      have(1).errors_on(:email)
 end
end
