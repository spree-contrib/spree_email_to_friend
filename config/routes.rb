routes = lambda do
  match "/email_to_friend/:type/:id" => 'email_sender#send_mail', as: :email_to_friend, via: [:get, :post]

  namespace :admin do
    resource :captcha_settings
  end
end

if Spree::Core::Engine.respond_to?(:add_routes)
  Spree::Core::Engine.add_routes(&routes)
else
  Spree::Core::Engine.routes.draw(&routes)
end
