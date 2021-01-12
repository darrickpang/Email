class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
    layout 'awesome'
    
    def welcome_email
        @user = params[:user]
        @url  = 'http://example.com/login'
        mail(to: @user.email,
        subject: 'Welcome to My Awesome Site') do |format|
        format.html { render 'another_template' }
        format.text { render plain: 'Render text' }
    end
end
