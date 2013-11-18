Spree::Core::Engine.routes.prepend do

  match "/email_to_friend/:type/:id" => 'email_sender#send_mail', as: :email_to_friend, via: [:get, :post]

  namespace :admin do
    resource :captcha_settings
  end
end
