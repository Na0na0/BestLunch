require 'rails_helper'

RSpec.describe Voter, type: :model do
  let(:survey) { Survey.new(name: "Monday lunch") }

  context "valid voter" do
    let(:voter) { Voter.new(email: "email@example.com", survey: survey) }

    it "is valid" do
      expect(voter).to be_valid
    end
  end

  context "invalid voter" do
    let(:voter) { Voter.new(email: nil, survey: survey) }

    it "is not valid" do
      expect(voter).not_to be_valid
    end
  end
end
