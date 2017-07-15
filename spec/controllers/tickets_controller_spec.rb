require 'spec_helper'

RSpec.describe TicketsController, type: :controller do

  describe  "Login access" do
    before :each do
      login_user
    end

    describe "GET #index" do
      it "assigns all tickets as @tickets" do
        ticket = create(:ticket)
        get :index
        expect(assigns(:tickets)).to eq([ticket])
      end
    end

    describe "GET #show" do
      it "assigns the requested ticket as @ticket" do
        ticket = create(:ticket)
        get :show, id: ticket
        expect(assigns(:ticket)).to eq(ticket)
      end
    end

    describe "GET #new" do
      it "assigns a new ticket as @ticket" do
        get :new
        expect(assigns(:ticket)).to be_a_new(Ticket)
      end
    end

    describe "GET #edit" do
      it "assigns the requested ticket as @ticket" do
        ticket = create(:ticket)
        get :edit, id: ticket
        expect(assigns(:ticket)).to eq(ticket)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Ticket" do
          expect {
            post :create, ticket: attributes_for(:ticket)
          }.to change(Ticket, :count).by(1)
        end

        it "assigns a newly created ticket as @ticket" do
          post :create, ticket: attributes_for(:ticket)
          expect(assigns(:ticket)).to be_a(Ticket)
          expect(assigns(:ticket)).to be_persisted
        end

        it "redirects to the created ticket" do
          post :create, ticket: attributes_for(:ticket)
          expect(response).to redirect_to(Ticket.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved ticket as @ticket" do
          post :create, ticket: attributes_for(:invalid_ticket)
          expect(assigns(:ticket)).to be_a_new(Ticket)
        end

        it "re-renders the 'new' template" do
          post :create, ticket: attributes_for(:invalid_ticket)
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      before :each do
        @ticket = create(:ticket)
      end
      context "with valid params" do

        it "updates the requested ticket" do
          put :update, id: @ticket, ticket: attributes_for(:ticket, costumer_message: 'This is an updated ticket message')
          @ticket.reload
          expect(@ticket.costumer_message).to eq('This is an updated ticket message')
        end

        it "assigns the requested ticket as @ticket" do
          put :update, id: @ticket, ticket: attributes_for(:ticket)
          expect(assigns(:ticket)).to eq(@ticket)
        end

        it "redirects to the ticket" do
          put :update, id: @ticket, ticket: attributes_for(:ticket)
          expect(response).to redirect_to(@ticket)
        end
      end

      context "with invalid params" do
        it "assigns the ticket as @ticket" do
          put :update, id: @ticket, ticket: attributes_for(:invalid_ticket)
          expect(assigns(:ticket)).to eq(@ticket)
        end

        it "re-renders the 'edit' template" do
          put :update, id: @ticket, ticket: attributes_for(:invalid_ticket)
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      before :each do
        @ticket = create(:ticket)
      end
      it "destroys the requested ticket" do
        expect {
          delete :destroy, id: @ticket
        }.to change(Ticket, :count).by(-1)
      end

      it "redirects to the tickets list" do
        delete :destroy, id: @ticket
        expect(response).to redirect_to(tickets_url)
      end
    end
  end
end
