class Rating < ApplicationRecord
  belongs_to :voter
  belongs_to :proposal

  validates :name, :proposal_id, :voter_id, presence: true

  NAMES = {
    "excellent" => 7,
    "very good" => 6,
    "good" => 5,
    "passable" => 4,
    "inadequate" => 3
  }

  enum name: NAMES
end
