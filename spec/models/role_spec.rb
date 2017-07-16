require 'rails_helper'

RSpec.describe Role, type: :model do
  it "is valid with a role" do
  	expect(build(:role)).to be_valid
  end

  it "is invalid without a name" do
  	role = build(:role, name: nil)
  	role.valid?
  	expect(role.errors[:name]).to include("can't be blank")
  end
end
