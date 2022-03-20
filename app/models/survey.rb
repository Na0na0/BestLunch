class Survey < ApplicationRecord
  validates :name, presence: true
  validates :proposals, length: { minimum: 2 }, on: :update
  validates :voters, length: { minimum: 2 }, on: :update

  has_many :proposals
  has_many :voters

  accepts_nested_attributes_for :proposals, allow_destroy: true
  accepts_nested_attributes_for :voters, allow_destroy: true
end
