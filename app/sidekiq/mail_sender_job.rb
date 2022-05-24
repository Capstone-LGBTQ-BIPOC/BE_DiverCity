class MailSenderJob
  include Sidekiq::Job

  def perform(user)
    RecMailer.rec_email(user).deliver_now
  end
end
