class EmailToFriendHooks < Spree::ThemeSupport::HookListener
  insert_after :product_description do
    %(<p class="email_to_friend">
        <%= link_to(t('email_to_friend.send_to_friend'), email_to_friend_url('product', @product)) %>
    </p>)
  end
end
