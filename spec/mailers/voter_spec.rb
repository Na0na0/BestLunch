require "rails_helper"

RSpec.describe VoterMailer, type: :mailer do
  let(:survey) { Survey.create(name: "Where do we eat?") }
  let(:voter) { Voter.create(email: "voter@email.com", survey: survey) }
  let(:email) { VoterMailer.with(voter: voter).invitation_email }

  describe "#invitation_email" do
    it "renders an invitation link" do
      expect(email.from).to eq(["notifications@example.com"])
      expect(email.to).to eq(["voter@email.com"])
      expect(email.subject).to eq("Your link to vote")
      expect(email.body.encoded).to match("http://example.com/voters/#{voter.token}/edit")
    end
  end
end
