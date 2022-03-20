require 'rails_helper'

RSpec.describe Voter, type: :model do
  context "valid voter" do
    let(:survey) { Voter.new(email: "email@example.com") }

    it "is valid" do
      expect(survey).to be_valid
    end
  end

  context "invalid voter" do
    let(:survey) { Voter.new(email: nil) }

    it "is not valid" do
      expect(survey).not_to be_valid
    end
  end
end
