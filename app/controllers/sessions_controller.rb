class SessionsController < Devise::SessionsController

	clear_respond_to
	respond_to :json

	skip_before_action :authenticate_user!, only: [:new, :create] 

	swagger_controller :sessions, 'Session Management'

	swagger_api :create do
		summary 'Sign In'
		param :form, "user[email]", :string, :required, "User Email"
		param :form, "user[password]", :string, :required, "User Password"
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

	swagger_api :new do
		summary 'Sign In'
		response :success
		response :unprocessable_entity
	end

	swagger_api :destroy do
		summary 'Sign Out'
		param :form, "user[email]", :string, :required, "User Email"
		response :success
		response :unauthorized
		response :unprocessable_entity
	end

end
