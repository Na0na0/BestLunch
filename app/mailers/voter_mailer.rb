class VoterMailer < ApplicationMailer
  def invitation_email
    @voter = params[:voter]
    mail(to: @voter.email, subject: 'Your link to vote')
  end
end
