class SpreeEmailToFriendHooks < Spree::ThemeSupport::HookListener
  Deface::Override.new(:virtual_path => "admin/configurations/index",
                       :name => "converted_admin_configurations_menu_384123912",
                       :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                       :text => "<%= configurations_menu_item(I18n.t('captcha.captcha_settings'), admin_captcha_settings_path, I18n.t('captcha.manage_keys')) %>",
                       :disabled => false)
  Deface::Override.new(:virtual_path => "products/show",
                       :name => "converted_product_description_351026984",
                       :insert_bottom => "[data-hook='product_description'], #product_description[data-hook]",
                       :text => "<p class=\"email_to_friend\">
          <%= link_to(t('email_to_friend.send_to_friend'), email_to_friend_url('product', @product)) %>
      </p>",
                       :disabled => false)
end
