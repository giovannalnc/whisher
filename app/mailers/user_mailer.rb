class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.hello.subject
  #
  def hello
    @user = params[:user]
    mail(to: @user.email, subject: 'Hello user!')
  end

  def decrease_price

  end
end
