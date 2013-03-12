Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "add_cloudsponge_admin_option",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
                     :text => "<%= configurations_sidebar_menu_item t('cloudsponge.cloudsponge_settings'), edit_admin_cloudsponge_settings_path %>",
                     :disabled => false)