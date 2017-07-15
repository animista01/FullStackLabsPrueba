require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  describe  "Login access" do
    before :each do
      login_user_admin
    end

    describe "GET #show" do
      it "assigns the requested user as @user" do
        user = create(:user)
        get :show, id: user
        expect(assigns(:user)).to eq(user)
      end
    end

    describe "GET #new" do
      it "assigns a new user as @user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    describe "GET #edit" do
      it "assigns the requested user as @user" do
        user = create(:user)
        get :edit, id: user
        expect(assigns(:user)).to eq(user)
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new user" do
          expect {
            post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end

        it "assigns a newly created user as @user" do
          post :create, user: attributes_for(:user)
          expect(assigns(:user)).to be_a(User)
          expect(assigns(:user)).to be_persisted
        end

        it "redirects to the created user" do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to(User.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved user as @user" do
          post :create, user: attributes_for(:invalid_user)
          expect(assigns(:user)).to be_a_new(User)
        end

        it "re-renders the 'new' template" do
          post :create, user: attributes_for(:invalid_user)
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      before :each do
        @user = create(:user)
      end
      context "with valid params" do

        it "updates the requested user" do
          put :update, id: @user, user: attributes_for(:user, email: 'bryan@gmail.com')
          @user.reload
          expect(@user.email).to eq('bryan@gmail.com')
        end

        it "assigns the requested user as @user" do
          put :update, id: @user, user: attributes_for(:user)
          expect(assigns(:user)).to eq(@user)
        end

        it "redirects to the user" do
          put :update, id: @user, user: attributes_for(:user)
          expect(response).to redirect_to(@user)
        end
      end

      context "with invalid params" do
        it "assigns the user as @user" do
          put :update, id: @user, user: attributes_for(:invalid_user)
          expect(assigns(:user)).to eq(@user)
        end

        it "re-renders the 'edit' template" do
          put :update, id: @user, user: attributes_for(:invalid_user)
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      before :each do
        @user = create(:user)
      end
      it "destroys the requested user" do
        expect {
          delete :destroy, id: @user
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        delete :destroy, id: @user
        expect(response).to redirect_to(users_url)
      end
    end
  end
end
