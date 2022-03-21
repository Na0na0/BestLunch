require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:survey) { Survey.new(name: "Monday lunch") }
  let(:voter) { Voter.create(email: "email@example.com", survey: survey) }
  let(:proposal) { Proposal.create(name: "Thai Restaurant", survey: survey) }

  context "valid rating" do
    let(:rating) { Rating.new(name: "excellent", proposal: proposal, voter: voter) }

    it "is valid" do
      expect(rating).to be_valid
    end
  end

  context "invalid rating" do
    let(:rating) { Rating.new(name: nil) }

    it "is not valid" do
      expect(rating).not_to be_valid
    end
  end
end
