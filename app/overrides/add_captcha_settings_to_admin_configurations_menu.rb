Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
                     :name => "converted_admin_configurations_menu_384123912",
                     :insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text => "<%= configurations_menu_item(I18n.t('captcha.captcha_settings'), main_app.admin_captcha_settings_path, I18n.t('captcha.manage_keys')) %>",
                     :disabled => false)
