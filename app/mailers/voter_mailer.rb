class VoterMailer < ApplicationMailer
  default from: ENV["SMTP_USERNAME"]

  def invitation_email
    @voter = params[:voter]
    mail(to: @voter.email, subject: 'Your link to vote')
  end
end
