class RegistrationsController < Devise::RegistrationsController

	def new
	end

	def create
    	@user = User.new(user_params)
    	@user.role_id = 1
	    respond_to do |format|
	      if @user.save
	      	sign_in(@user)
            format.html { redirect_to tickets_path }
	      else
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private 
	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end