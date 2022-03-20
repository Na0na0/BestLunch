class VoterMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def invitation_email
    @voter = params[:voter]
    mail(to: @voter.email, subject: 'Your link to vote')
  end
end
