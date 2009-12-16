class EmailToFriendHooks < Spree::ThemeSupport::HookListener
  insert_after :product_description do
    content_tag('p', link_to(t('email_to_friend.send_to_friend'), email_to_friend_url('product', @product)), :id => 'email_to_friend')
  end
end
