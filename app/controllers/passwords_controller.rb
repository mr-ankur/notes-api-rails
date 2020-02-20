class PasswordsController < Devise::PasswordsController

	clear_respond_to
	respond_to :json

	swagger_controller :passwords, 'Registration Management'

	swagger_api :create do
		summary 'Sign In'
		param :form, "user[email]", :string, :required, "User Email"
		param :form, "user[password]", :string, :required, "User Password"
		response :success
		response :unprocessable_entity
	end

end
