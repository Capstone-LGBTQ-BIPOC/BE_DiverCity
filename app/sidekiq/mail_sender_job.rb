class MailSenderJob
  include Sidekiq::Job

  def perform(user, user_name)
    RecMailer.rec_email(user, user_name).deliver_now
  end
end
