class RecMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rec_mailer.Rec_email.subject
  #
  def rec_email(user, user_name)
    @user = user
    @user_name = user_name
    mail to: @user, subject: 'Thanks for the recommendation'
  end
end
