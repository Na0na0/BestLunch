class VotersController < ApplicationController
  def edit
    @voter = Voter.find_by(token: params[:token])
    @survey = @voter.survey
    @proposals = @survey.proposals
  end
end
