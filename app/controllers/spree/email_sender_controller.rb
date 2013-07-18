class Spree::EmailSenderController < Spree::BaseController

  helper Spree::StoreHelper
  helper Spree::BaseHelper
  include Spree::Core::ControllerHelpers::Order

  before_filter :find_object

  def send_mail
    if request.get?
      @mail_to_friend = Spree::MailToFriend.new(:sender_email => spree_current_user.try(:email))
    else
      mail_to_friend
    end
  end

  private

    def mail_to_friend
      @mail_to_friend = Spree::MailToFriend.new(params[:mail_to_friend])
      @mail_to_friend.host = request.env['HTTP_HOST']
      respond_to do |format|
        format.html do
          captcha_passed = !Spree::Captcha::Config[:use_captcha] || verify_recaptcha(:private_key => Spree::Captcha::Config[:private_key])
          if @mail_to_friend.valid? && captcha_passed
            flash[:notice] = I18n.t('email_to_friend.mail_sent_to', :email => @mail_to_friend.recipient_email).html_safe
            flash[:notice] << ActionController::Base.helpers.link_to(I18n.t('email_to_friend.send_to_other'), email_to_friend_path(@object.class.name.split("::").last.downcase, @object)).html_safe

            send_message(@object, @mail_to_friend)

            method_name = "after_delivering_#{@object.class.name.downcase}_mail"
            send(method_name) if respond_to?(method_name, true)

            redirect_to @object
          else
            render :action => :send_mail
          end
        end
      end
    end

    #extract send message to make easier to override
    def send_message(object, mail_to_friend)
      Spree::ToFriendMailer.mail_to_friend(object,@mail_to_friend).deliver
    end

    def find_object
      class_name = "Spree::#{(params[:type].titleize)}".constantize
      return false if params[:id].blank?
      @object = class_name.find_by_id(params[:id])
      if class_name.respond_to?('find_by_permalink')
        @object ||= class_name.find_by_permalink(params[:id])
      end
      if class_name.respond_to?('get_by_param')
        @object ||= class_name.get_by_param(params[:id])
      end
      # Display 404 page if object is not found.
      raise ActiveRecord::RecordNotFound if @object.nil?
    end

end
