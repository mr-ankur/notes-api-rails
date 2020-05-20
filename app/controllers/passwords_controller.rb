class PasswordsController < Devise::PasswordsController

	clear_respond_to
	respond_to :json

	skip_before_action :authenticate_user!, only: [:new, :create, :edit]

	swagger_controller :passwords, 'Password Management'

	swagger_api :create do
		summary 'Create Password'
		param :form, "user[email]", :string, :required, "User Email"
		param :form, "user[password]", :string, :required, "User Password"
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

	swagger_api :update do
		summary 'Update Password'
		param :form, "user[email]", :string, :required, "User Email"
		param :form, "user[password]", :string, :required, "Old Password"
		param :form, "user[new_password]", :string, :required, "New Password"
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

	swagger_api :edit do
		summary 'Edit Password'
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

	swagger_api :new do
		summary 'New Password'
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

end
