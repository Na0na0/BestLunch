require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context "valid proposal" do
    let(:proposal) { Proposal.new(name: "Thai Restaurant") }

    it "is valid" do
      expect(proposal).to be_valid
    end
  end

  context "invalid proposal" do
    let(:proposal) { Proposal.new(name: nil) }

    it "is not valid" do
      expect(proposal).not_to be_valid
    end
  end
end
