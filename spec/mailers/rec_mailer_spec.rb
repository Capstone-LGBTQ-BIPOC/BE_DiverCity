require "rails_helper"

RSpec.describe RecMailer, type: :mailer do
  describe "Rec_email" do
    user = User.create(user_name: "rich", email: "richardLabreque@gmail.com")
    let(:mail) { RecMailer.rec_email(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Thanks for the recommendation")
      expect(mail.to).to eq(["richardLabreque@gmail.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Rich Thanks for the recommendation")
    # end
  end

end
