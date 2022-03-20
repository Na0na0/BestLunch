class Voter < ApplicationRecord
  validates :email, presence: true, email: true
end
