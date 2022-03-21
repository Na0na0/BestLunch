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
    scores_proposals.first[:proposal]
  end

  def scores_proposals
    proposals.map(&:majority_rating).sort_by { |score| [-score[:name_value], -score[:rating_count]]  }
  end
end
