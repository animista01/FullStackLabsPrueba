module ControllerHelpers
	def login_user_admin(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    sign_in user
  end
  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    sign_in user
  end
end