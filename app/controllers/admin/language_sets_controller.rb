class Admin::LanguageSetsController < Admin::AdminController
  before_action :set_language_set, only: [:show, :edit, :update, :destroy]

  # GET /language_sets
  # GET /language_sets.json
  def index
    @language_sets = LanguageSet.all
  end

  # GET /language_sets/1
  # GET /language_sets/1.json
  def show
  end

  # GET /language_sets/new
  def new
    @language_set = LanguageSet.new
  end

  # GET /language_sets/1/edit
  def edit
  end

  # POST /language_sets
  # POST /language_sets.json
  def create
    @language_set = LanguageSet.new(language_set_params)

    respond_to do |format|
      if @language_set.save
        format.html { redirect_to @language_set, notice: 'Language set was successfully created.' }
        format.json { render :show, status: :created, location: @language_set }
      else
        format.html { render :new }
        format.json { render json: @language_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /language_sets/1
  # PATCH/PUT /language_sets/1.json
  def update
    respond_to do |format|
      if @language_set.update(language_set_params)
        format.html { redirect_to @language_set, notice: 'Language set was successfully updated.' }
        format.json { render :show, status: :ok, location: @language_set }
      else
        format.html { render :edit }
        format.json { render json: @language_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_sets/1
  # DELETE /language_sets/1.json
  def destroy
    @language_set.destroy
    respond_to do |format|
      format.html { redirect_to language_sets_url, notice: 'Language set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language_set
      @language_set = LanguageSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_set_params
      params.require(:language_set).permit(:name)
    end
end
