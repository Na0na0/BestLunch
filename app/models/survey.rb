class Survey < ApplicationRecord
  validates :name, presence: true
  validates :proposals, length: { minimum: 2 }, on: :update
  validates :voters, length: { minimum: 2 }, on: :update

  has_many :proposals
  has_many :voters
  has_many :ratings, through: :proposals

  accepts_nested_attributes_for :proposals, allow_destroy: true
  accepts_nested_attributes_for :voters, allow_destroy: true

  def number_of_votes
    return 0 unless proposals.count > 0

    ratings.count / proposals.count
  end

  def winner_proposal
    majority_mentions.first
  end

  def majority_mentions
    @majority_mentions ||= MajorityMentions.new(self)
  end

  # Sort the surveys's proposals from the highest ratings to the lowest
  class MajorityMentions
    attr_reader :proposals, :all, :first

    def initialize(survey)
      @proposals = survey.proposals
      @all = proposals.map(&:majority_rating).sort_by { |score| [-score.value, -score.rating_count, -score.rating_sum] }
      @first = all.first.proposal
    end
  end
end
