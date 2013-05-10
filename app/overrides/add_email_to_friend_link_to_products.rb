Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "converted_product_description_351026984",
                     :insert_bottom => "[data-hook='product_description'], #product_description[data-hook]",
                     :text => "<p class=\"email_to_friend\">
        <%= link_to Spree.t('email_to_friend.send_to_friend'), email_to_friend_url('product', @product) %>
    </p>",
                     :disabled => false)
