class Admin::DeskUserMembershipsController < Admin::AdminController
  before_action :set_desk_user_membership, only: [:show, :edit, :update, :destroy]

  # GET /desk_user_memberships
  # GET /desk_user_memberships.json
  def index
    @desk_user_memberships = DeskUserMembership.all
  end

  # GET /desk_user_memberships/1
  # GET /desk_user_memberships/1.json
  def show
  end

  # GET /desk_user_memberships/new
  def new
    @desk_user_membership = DeskUserMembership.new
  end

  # GET /desk_user_memberships/1/edit
  def edit
  end

  # POST /desk_user_memberships
  # POST /desk_user_memberships.json
  def create
    @desk_user_membership = DeskUserMembership.new(desk_user_membership_params)

    respond_to do |format|
      if @desk_user_membership.save
        format.html { redirect_to @desk_user_membership, notice: 'Desk user membership was successfully created.' }
        format.json { render :show, status: :created, location: @desk_user_membership }
      else
        format.html { render :new }
        format.json { render json: @desk_user_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desk_user_memberships/1
  # PATCH/PUT /desk_user_memberships/1.json
  def update
    respond_to do |format|
      if @desk_user_membership.update(desk_user_membership_params)
        format.html { redirect_to @desk_user_membership, notice: 'Desk user membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @desk_user_membership }
      else
        format.html { render :edit }
        format.json { render json: @desk_user_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desk_user_memberships/1
  # DELETE /desk_user_memberships/1.json
  def destroy
    @desk_user_membership.destroy
    respond_to do |format|
      format.html { redirect_to desk_user_memberships_url, notice: 'Desk user membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desk_user_membership
      @desk_user_membership = DeskUserMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desk_user_membership_params
      params.require(:desk_user_membership).permit(:desk_id_id, :user_id_id)
    end
end
