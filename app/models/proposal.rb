class Proposal < ApplicationRecord
  validates :name, presence: true
  validates_db_uniqueness_of :name, scope: :survey_id, rescue: :always

  has_many :ratings
  belongs_to :survey

  Rating::NAMES.each do |rating_name, _rating_value|
    define_method("#{rating_name.parameterize.underscore}_percent") do
      (ratings.public_send(rating_name.parameterize.underscore).count.to_f / ratings.count.to_f * 100).round(1)
    end
  end

  def majority_mention
    majority_rating.name
  end

  def majority_rating
    @majority_rating ||= MajorityRating.new(ratings, self)
  end
  # Determine which rating has an absolute majority for this proposal
  class MajorityRating
    attr_reader :name, :value, :rating_count, :rating_sum, :proposal

    def initialize(ratings, proposal)
      @name = ""
      @value = -1
      @rating_count = 0
      @rating_sum = ratings.sum(:name)
      @proposal = proposal
      return if ratings.none?

      ratings.order(name: :desc).pluck(:name).tally.each do |name, amount|
        @rating_count += amount
        @name = name
        @value = Rating::NAMES[name]
        return if @rating_count > @proposal.survey.number_of_votes / 2
      end
    end
  end
end
