class Voter < ApplicationRecord
  validates :email, presence: true, email: true

  has_secure_token

  after_create :send_invitation_link

  belongs_to :survey

  private

  def send_invitation_link
    VoterMailer.with(voter: self).invitation_email.deliver_later
  end
end
