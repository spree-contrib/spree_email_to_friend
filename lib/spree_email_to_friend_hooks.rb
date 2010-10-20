class SpreeEmailToFriendHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('captcha.captcha_settings'), admin_captcha_settings_path, I18n.t('captcha.manage_keys')) %>"
  end

  insert_after :product_description do
    %(<p class="email_to_friend">
        <%= link_to(t('email_to_friend.send_to_friend'), email_to_friend_url('product', @product)) %>
    </p>)
  end
end
