require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context "valid proposal" do
    let(:survey) { Proposal.new(name: "Monday lunch") }

    it "is valid" do
      expect(survey).to be_valid
    end
  end

  context "invalid proposal" do
    let(:survey) { Proposal.new(name: nil) }

    it "is not valid" do
      expect(survey).not_to be_valid
    end
  end
end
