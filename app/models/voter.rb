class Voter < ApplicationRecord
  validates :email, presence: true, email: true

  has_secure_token

  after_create :send_invitation_link

  belongs_to :survey
  has_many :ratings

  accepts_nested_attributes_for :ratings

  private

  def send_invitation_link
    VoterMailer.with(voter: self).invitation_email.deliver_later
  end
end