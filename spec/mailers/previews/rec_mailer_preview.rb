# Preview all emails at http://localhost:3000/rails/mailers/rec_mailer
class RecMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/rec_mailer/Rec_email
  def rec_email
    user = User.first
    RecMailer.rec_email(user)
  end

end
