class Admin::JuryChallengeMembershipsController < Admin::AdminController
  before_action :set_jury_challenge_membership, only: [:show, :edit, :update, :destroy]

  # GET /jury_challenge_memberships
  # GET /jury_challenge_memberships.json
  def index
    @jury_challenge_memberships = JuryChallengeMembership.all
  end

  # GET /jury_challenge_memberships/1
  # GET /jury_challenge_memberships/1.json
  def show
  end

  # GET /jury_challenge_memberships/new
  def new
    @jury_challenge_membership = JuryChallengeMembership.new
  end

  # GET /jury_challenge_memberships/1/edit
  def edit
  end

  # POST /jury_challenge_memberships
  # POST /jury_challenge_memberships.json
  def create
    @jury_challenge_membership = JuryChallengeMembership.new(jury_challenge_membership_params)

    respond_to do |format|
      if @jury_challenge_membership.save
        format.html { redirect_to @jury_challenge_membership, notice: 'Jury challenge membership was successfully created.' }
        format.json { render :show, status: :created, location: @jury_challenge_membership }
      else
        format.html { render :new }
        format.json { render json: @jury_challenge_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jury_challenge_memberships/1
  # PATCH/PUT /jury_challenge_memberships/1.json
  def update
    respond_to do |format|
      if @jury_challenge_membership.update(jury_challenge_membership_params)
        format.html { redirect_to @jury_challenge_membership, notice: 'Jury challenge membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @jury_challenge_membership }
      else
        format.html { render :edit }
        format.json { render json: @jury_challenge_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jury_challenge_memberships/1
  # DELETE /jury_challenge_memberships/1.json
  def destroy
    @jury_challenge_membership.destroy
    respond_to do |format|
      format.html { redirect_to jury_challenge_memberships_url, notice: 'Jury challenge membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jury_challenge_membership
      @jury_challenge_membership = JuryChallengeMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jury_challenge_membership_params
      params.require(:jury_challenge_membership).permit(:user_id_id, :challenge_id_id)
    end
end
