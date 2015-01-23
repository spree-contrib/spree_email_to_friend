Deface::Override.new(
  virtual_path: 'spree/products/show',
  name: 'converted_product_description_351026984',
  insert_bottom: '[data-hook="product_description"], #product_description[data-hook]',
  text: '<p class="email_to_friend"><%= link_to Spree.t(:send_to_friend, scope: :email_to_friend), email_to_friend_path("product", @product) %></p>',
  original: '23a81432df67f93cad7563f7b118d6f901b8e42b'
)
