class Manager::TeamsController < Manager::BaseController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /manager/teams
  # GET /manager/teams.json
  def index
    @teams = Team.all
  end

  # GET /manager/teams/1
  # GET /manager/teams/1.json
  def show
  end

  # GET /manager/teams/new
  def new
    @team = Team.new
  end

  # GET /manager/teams/1/edit
  def edit
  end

  # POST /manager/teams
  # POST /manager/teams.json
  def create

    @team = Team.create(team_params)

    respond_to do |format|
      if @team.save
        TeamUserMembership.create(team: @team, user: current_user, role: :admin)
        format.html {redirect_to manager_teams_path, notice: 'Team was successfully created.'}
        format.json {render :show, status: :created, location: @team}
      else
        format.html {render :new}
        format.json {render json: manager_teams_path.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /manager/teams/1
  # PATCH/PUT /manager/teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html {redirect_to teams_path, notice: 'Team was successfully updated.'}
        format.json {render :show, status: :ok, location: @team}
      else
        format.html {render :edit}
        format.json {render json: @team.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /manager/teams/1
  # DELETE /manager/teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html {redirect_to teams_url, notice: 'Team was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:name, :description)
  end
end
