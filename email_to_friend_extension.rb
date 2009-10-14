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
    AppConfiguration.class_eval do
      # this keys works for localhost
      preference :recaptcha_private_key, :string, :default => '6LfIsgEAAAAAAGfB6Z0lEUtdL3GVuBkRa9cYlMZz'
      preference :recaptcha_public_key, :string, :default => '6LfIsgEAAAAAALpT20eiC3RslZQmmCbiNS-AUvSe'
    end

    ProductsController.class_eval do
      include TellFriendActions
    end

    # Add your extension tab to the admin.
    # Requires that you have defined an admin controller:
    # app/controllers/admin/yourextension_controller
    # and that you mapped your admin in config/routes

    #Admin::BaseController.class_eval do
    #  before_filter :add_yourextension_tab
    #
    #  def add_yourextension_tab
    #    # add_extension_admin_tab takes an array containing the same arguments expected
    #    # by the tab helper method:
    #    #   [ :extension_name, { :label => "Your Extension", :route => "/some/non/standard/route" } ]
    #    add_extension_admin_tab [ :yourextension ]
    #  end
    #end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
