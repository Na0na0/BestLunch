require 'rails_helper'

RSpec.describe Survey, type: :model do
  context "valid survey" do
    let(:survey) { Survey.new(name: "Monday lunch") }

    it "is valid" do
      expect(survey).to be_valid
    end
  end

  context "invalid survey" do
    let(:survey) { Survey.new(name: nil) }

    it "is not valid" do
      expect(survey).not_to be_valid
    end
  end
end
