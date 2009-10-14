# Put your extension routes here.

map.resources :products, :member => { :tell_a_friend => :get, :mail_to_friend => :put }

map.namespace :admin do |admin|
  admin.resource :captcha_settings
end
