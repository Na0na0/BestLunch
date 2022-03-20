# Preview all emails at http://localhost:3000/rails/mailers/voter
class VoterPreview < ActionMailer::Preview
  def invitation_email
    VoterMailer.with(voter: Voter.last).invitation_email
  end
end
