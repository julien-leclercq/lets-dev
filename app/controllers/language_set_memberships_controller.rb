class LanguageSetMembershipsController < ApplicationController
  before_action :set_language_set_membership, only: [:show, :edit, :update, :destroy]

  # GET /language_set_memberships
  # GET /language_set_memberships.json
  def index
    @language_set_memberships = LanguageSetMembership.all
  end

  # GET /language_set_memberships/1
  # GET /language_set_memberships/1.json
  def show
  end

  # GET /language_set_memberships/new
  def new
    @language_set_membership = LanguageSetMembership.new
  end

  # GET /language_set_memberships/1/edit
  def edit
  end

  # POST /language_set_memberships
  # POST /language_set_memberships.json
  def create
    @language_set_membership = LanguageSetMembership.new(language_set_membership_params)

    respond_to do |format|
      if @language_set_membership.save
        format.html { redirect_to @language_set_membership, notice: 'Language set membership was successfully created.' }
        format.json { render :show, status: :created, location: @language_set_membership }
      else
        format.html { render :new }
        format.json { render json: @language_set_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /language_set_memberships/1
  # PATCH/PUT /language_set_memberships/1.json
  def update
    respond_to do |format|
      if @language_set_membership.update(language_set_membership_params)
        format.html { redirect_to @language_set_membership, notice: 'Language set membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @language_set_membership }
      else
        format.html { render :edit }
        format.json { render json: @language_set_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_set_memberships/1
  # DELETE /language_set_memberships/1.json
  def destroy
    @language_set_membership.destroy
    respond_to do |format|
      format.html { redirect_to language_set_memberships_url, notice: 'Language set membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language_set_membership
      @language_set_membership = LanguageSetMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_set_membership_params
      params.require(:language_set_membership).permit(:language_id_id, :language_set_id_id)
    end
end
