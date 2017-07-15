class RegistrationsController < Devise::RegistrationsController
	def create
		super
    	resource.role_id = 1

	end
end