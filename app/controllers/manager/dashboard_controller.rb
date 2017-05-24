class Manager::DashboardController < Manager::BaseController
  def index
    @challenges = Challenge.current
  end
end
