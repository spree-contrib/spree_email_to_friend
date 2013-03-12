module Spree
  module Admin
    class CloudspongeSettingsController < BaseController
      def update
        Spree::Cloudsponge::Config.set(params[:preferences])

        respond_to do |format|
          format.html {
            redirect_to edit_admin_cloudsponge_settings_path
          }
        end
      end
    end
  end
end
