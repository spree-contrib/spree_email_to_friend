module TellFriendActions
  def self.included(base)
    base.class_eval do
      before_filter :load_data, :only => [:show, :tell_a_friend]
    end
  end

  def tell_a_friend
    load_object
    @mail_to_friend = MailToFriend.new(:sender_email => current_user.try(:email))
    respond_to do |format|
      format.html
    end
  end

  def mail_to_friend
    load_object
    @mail_to_friend = MailToFriend.new(params[:mail_to_friend])
    respond_to do |format|
      format.html do
        if @mail_to_friend.valid? &&
            verify_recaptcha(:private_key => Spree::Captcha::Config[:private_key])
          flash[:notice] = I18n.t('email_to_friend.mail_sent_to', :email => @mail_to_friend.recipient_email)
          flash[:notice] << @template.link_to(I18n.t('email_to_friend.send_to_other'),
                                              tell_a_friend_product_path(@product))

          ProductMailer.deliver_mail_to_friend(@product, @mail_to_friend)
          redirect_to product_url(@product)
        else
          load_data
          render :tell_a_friend
        end
      end
    end
  end
end
