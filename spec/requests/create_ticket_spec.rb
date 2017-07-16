require "spec_helper"

describe "Creates an costumer user then create a ticket", type: :request do
  before(:each) do
    @user = create(:user, role_id: 1)
    sign_in @user
	end
  it "Create a ticket" do

    post "/tickets/", { ticket: attributes_for(:ticket) }
   	expect(response).to redirect_to ticket_path(assigns[:ticket])
  end
end