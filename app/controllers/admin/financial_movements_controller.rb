class Admin::FinancialMovementsController < Admin::AdminController
  before_action :set_financial_movement, only: [:show, :edit, :update, :destroy]

  # GET /financial_movements
  # GET /financial_movements.json
  def index
    @financial_movements = FinancialMovement.all
  end

  # GET /financial_movements/1
  # GET /financial_movements/1.json
  def show
  end

  # GET /financial_movements/new
  def new
    @financial_movement = FinancialMovement.new
  end

  # GET /financial_movements/1/edit
  def edit
  end

  # POST /financial_movements
  # POST /financial_movements.json
  def create
    @financial_movement = FinancialMovement.new(financial_movement_params)

    respond_to do |format|
      if @financial_movement.save
        format.html { redirect_to @financial_movement, notice: 'Financial movement was successfully created.' }
        format.json { render :show, status: :created, location: @financial_movement }
      else
        format.html { render :new }
        format.json { render json: @financial_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_movements/1
  # PATCH/PUT /financial_movements/1.json
  def update
    respond_to do |format|
      if @financial_movement.update(financial_movement_params)
        format.html { redirect_to @financial_movement, notice: 'Financial movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @financial_movement }
      else
        format.html { render :edit }
        format.json { render json: @financial_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_movements/1
  # DELETE /financial_movements/1.json
  def destroy
    @financial_movement.destroy
    respond_to do |format|
      format.html { redirect_to financial_movements_url, notice: 'Financial movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_movement
      @financial_movement = FinancialMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_movement_params
      params.require(:financial_movement).permit(:amount, :description)
    end
end
