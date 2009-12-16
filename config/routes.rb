# Put your extension routes here.

map.email_to_friend "/email_to_friend/:type/:id", :controller => 'email_sender', :action => 'send_mail'

map.namespace :admin do |admin|
  admin.resource :captcha_settings
end
