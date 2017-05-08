class TeamChallengeMembershipsController < ApplicationController
  before_action :set_team_challenge_membership, only: [:show, :edit, :update, :destroy]

  # GET /team_challenge_memberships
  # GET /team_challenge_memberships.json
  def index
    @team_challenge_memberships = TeamChallengeMembership.all
  end

  # GET /team_challenge_memberships/1
  # GET /team_challenge_memberships/1.json
  def show
  end

  # GET /team_challenge_memberships/new
  def new
    @team_challenge_membership = TeamChallengeMembership.new
  end

  # GET /team_challenge_memberships/1/edit
  def edit
  end

  # POST /team_challenge_memberships
  # POST /team_challenge_memberships.json
  def create
    @team_challenge_membership = TeamChallengeMembership.new(team_challenge_membership_params)

    respond_to do |format|
      if @team_challenge_membership.save
        format.html { redirect_to @team_challenge_membership, notice: 'Team challenge membership was successfully created.' }
        format.json { render :show, status: :created, location: @team_challenge_membership }
      else
        format.html { render :new }
        format.json { render json: @team_challenge_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_challenge_memberships/1
  # PATCH/PUT /team_challenge_memberships/1.json
  def update
    respond_to do |format|
      if @team_challenge_membership.update(team_challenge_membership_params)
        format.html { redirect_to @team_challenge_membership, notice: 'Team challenge membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_challenge_membership }
      else
        format.html { render :edit }
        format.json { render json: @team_challenge_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_challenge_memberships/1
  # DELETE /team_challenge_memberships/1.json
  def destroy
    @team_challenge_membership.destroy
    respond_to do |format|
      format.html { redirect_to team_challenge_memberships_url, notice: 'Team challenge membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_challenge_membership
      @team_challenge_membership = TeamChallengeMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_challenge_membership_params
      params.require(:team_challenge_membership).permit(:team_id_id, :challenge_id_id)
    end
end
