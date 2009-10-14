# -*- coding: utf-8 -*-
# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'

require 'tell_friend_actions'

class EmailToFriendExtension < Spree::Extension
  version "1.0"
  description "Tell a friend about a product"
  url "http://github.com/calas/spree-email-to-friend"

  # Please use email_to_friend/config/routes.rb instead for extension routes.

  def self.require_gems(config)
    config.gem "recaptcha", :lib => "recaptcha/rails", :source => "http://gemcutter.org"
    config.gem "validatable"
  end

  def activate
    ProductsController.class_eval do
      include TellFriendActions
    end

    Admin::ConfigurationsController.class_eval do
      before_filter :add_captcha_settings_links, :only => :index

      def add_captcha_settings_links
        @extension_links << {
          :link => admin_captcha_settings_path,
          :link_text => t('captcha.captcha_settings'),
          :description => t('captcha.manage_keys')
        }
      end
    end
  end
end
