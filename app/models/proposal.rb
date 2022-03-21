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
    rating_count = 0

    ratings.order(name: :desc).pluck(:name).tally.each do |name, amount|
      rating_count += amount
      if rating_count > survey.number_of_votes / 2
        return { name: name,
                 name_value: Rating::NAMES[name],
                 rating_count: rating_count,
                 proposal: self
        }
      end
    end
  end
end
