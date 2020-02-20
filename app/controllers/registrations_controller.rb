class RegistrationsController < Devise::RegistrationsController

	clear_respond_to
	respond_to :json

	swagger_controller :registrations, 'Registration Management'

	swagger_api :create do
		summary 'Sign Up'
		param :form, "user[email]", :string, :required, "User id of note"
		param :form, "user[password]", :string, :required, "Label of note"
		response :success
		response :unprocessable_entity
	end

end
