class Proposal < ApplicationRecord
  validates :name, presence: true
  validates_db_uniqueness_of :name, scope: :survey_id, rescue: :always

  has_many :ratings
  belongs_to :survey

  Rating::NAMES.keys.each do |rating_name|
    define_method("#{rating_name.parameterize.underscore}_percent") do
      return 0 if ratings.none?

      (ratings.public_send(rating_name.parameterize.underscore).count.to_f / ratings.count.to_f * 100).round(1)
    end
  end

  def score
    @score ||= Score.for(self)
  end
end
