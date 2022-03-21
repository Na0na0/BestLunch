class Proposal < ApplicationRecord
  validates :name, presence: true

  has_many :ratings
  belongs_to :survey

  Rating::NAMES.each do |rating_name, _rating_value|
    define_method("#{rating_name.parameterize.underscore}_percent") do
      (ratings.public_send(rating_name.parameterize.underscore).count.to_f / ratings.count.to_f * 100).round(1)
    end
  end

  def majority_mention
    majority_rating[:name]
  end

  # Determine which judgment has an absolute majority for this proposal
  def majority_rating
    score = { name: "", name_value: -1, rating_count: 0, proposal: self }
    return score if ratings.none?

    ratings.order(name: :desc).pluck(:name).tally.each do |name, amount|
      score[:rating_count] += amount
      score[:name] = name
      score[:name_value] = Rating::NAMES[name]
      return score if score[:rating_count] > survey.number_of_votes / 2
    end
  end
end
