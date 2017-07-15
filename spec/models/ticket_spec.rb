require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "is valid with a costumer_message and costumer_id" do
  	expect(build(:ticket)).to be_valid
  end

  it "is invalid without a costumer_message" do
  	ticket = build(:ticket, costumer_message: nil)
  	ticket.valid?
  	expect(ticket.errors[:costumer_message]).to include("can't be blank")
  end
  
  it "is invalid without a costumer_id" do
  	ticket = build(:ticket, costumer_id: nil)
  	ticket.valid?
  	expect(ticket.errors[:costumer_id]).to include("can't be blank")
  end
end
