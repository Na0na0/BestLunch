class VotersController < ApplicationController

  before_action :set_voter, only: %i[  edit update ]

  def edit
    if @voter.ratings.length == 0
      @voter.survey.proposals.each do |proposal|
        @voter.ratings.create(proposal: proposal)
      end
    else
      redirect_to survey_url(@voter.survey), notice: "you have voted already"
    end
  end

  def update
    respond_to do |format|
      if @voter.update(voter_params)
        format.html { redirect_to survey_url(@voter.survey), notice: "Voter was successfully updated." }
        format.json { render :show, status: :ok, location: @voter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_voter
    @voter = Voter.find_by(token: params[:token])
  end

  def voter_params
    params.require(:voter).permit(ratings_attributes: [:name, :id, :proposal_id])
  end
end
