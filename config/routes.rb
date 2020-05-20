Swagger::Docs::Config.base_api_controller = ActionController::API
include Swagger::Docs::ImpotentMethods
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,defaults: { format: :json }, controllers: { registrations: "registrations", sessions: "sessions", passwords: "passwords",confirmations: "confirmations", invitations: "invitations"}

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :notes
    end
  end

end
