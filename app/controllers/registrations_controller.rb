class RegistrationsController < Devise::RegistrationsController

	clear_respond_to
	respond_to :json

	skip_before_action :authenticate_user!, only: [:new, :create, :edit]

	swagger_controller :registrations, 'Registration Management'

	swagger_api :create do
		summary 'Sign Up'
		param :form, "user[email]", :string, :required, "User Email"
		param :form, "user[password]", :string, :required, "User Password"
		response :success
		response :unprocessable_entity
	end

	swagger_api :new do
		summary 'New User'
		response :success
		response :unprocessable_entity
	end

	swagger_api :destroy do
		summary 'Delete User'
		param :form, "user[email]", :string, :required, "User Email"
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

	swagger_api :update do
		summary 'Update User'
		param :form, "user[email]", :string, :required, "User Email"
		param :form, "user[password]", :string, :required, "User Password"
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

	swagger_api :edit do
		summary 'Edit User'
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

end
