class Survey < ApplicationRecord
  validates :name, presence: true
  validates :proposals, length: { minimum: 2 }, on: :update

  has_many :proposals

  accepts_nested_attributes_for :proposals, allow_destroy: true
end
