class UserMailer < ApplicationMailer
    before_action { @business, @user = params[:business], params[:user] }

    after_action :set_delivery_options,
               :prevent_delivery_to_guests,
               :set_business_headers

    def feedback_message
    end

    def campaign_message
    end

    private

    def set_delivery_options
        # You have access to the mail instance,
        # @business and @user instance variables here
        if @business && @business.has_smtp_settings?
            mail.delivery_method.settings.merge!(@business.smtp_settings)
        end
    end

    def prevent_delivery_to_guests
        if @user && @user.guest?
            mail.perform_deliveries = false
        end
    end

    def set_business_headers
        if @business
            headers["X-SMTPAPI-CATEGORY"] = @business.code
        end
    end
end
