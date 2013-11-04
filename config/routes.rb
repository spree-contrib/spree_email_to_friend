Spree::Core::Engine.routes.prepend do

  post "/email_to_friend/:type/:id" => 'email_sender#send_mail', as: :email_to_friend

  namespace :admin do
    resource :captcha_settings
  end
end