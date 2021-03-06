require "rails_helper"

RSpec.describe RecMailer, type: :mailer do
  describe "Rec_email" do
    user = User.create(user_name: "rich", email: "example@example.com")
    let(:mail) { RecMailer.rec_email(user.email, user.user_name) }

    it "renders the headers" do
      expect(mail.subject).to eq("Thanks for the recommendation")
      expect(mail.to).to eq(["example@example.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Rich Thanks for the recommendation")
    # end
  end

end
