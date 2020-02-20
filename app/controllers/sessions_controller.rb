class SessionsController < Devise::SessionsController
	skip_before_action :verify_signed_out_user
	after_action :test, only: :create
	before_action :test, only: :destroy
	clear_respond_to
	respond_to :json

	swagger_controller :sessions, 'Registration Management'

	swagger_api :create do
		summary 'Sign In'
		param :form, "user[email]", :string, :required, "User Email"
		param :form, "user[password]", :string, :required, "User Password"
		response :success
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
		response :unprocessable_entity
	end

end
