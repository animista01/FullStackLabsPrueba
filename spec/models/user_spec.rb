require 'rails_helper'

RSpec.describe User, type: :model do
	it "is valid with a email and password" do
  	expect(build(:user)).to be_valid
  end

  it "is invalid without a email" do
  	user = build(:user, email: nil)
  	user.valid?
  	expect(user.errors[:email]).to include("can't be blank")
  end
  
  it "is invalid without a password" do
  	user = build(:user, password: nil)
  	user.valid?
  	expect(user.errors[:password]).to include("can't be blank")
  end
end
