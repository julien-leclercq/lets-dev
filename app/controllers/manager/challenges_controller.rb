class Manager::ChallengesController < Manager::BaseController
  before_action :set_challenge, only: [:show]

  def index
    @current_challenges = Challenge.current
    @ended_challenges = Challenge.ended
  end

  def show
  end

  private
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
