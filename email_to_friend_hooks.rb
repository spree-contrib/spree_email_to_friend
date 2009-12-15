class EmailToFriendHooks < Spree::ThemeSupport::HookListener
  insert_after :product_description do
    content_tag('p', link_to(t('email_to_friend.send_to_friend'), tell_a_friend_product_path(@product)), :id => 'email_to_friend')
  end
end

