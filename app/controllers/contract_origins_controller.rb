class ContractOriginsController < ApplicationController
  before_action :set_contract_origin, only: [:show, :edit, :update, :destroy]

  # GET /contract_origins
  # GET /contract_origins.json
  def index
    @contract_origins = ContractOrigin.all
  end
  
  #to list the contracts on going to create a delivery
  def indexUser
    #to show a list of the matches for the user
    @journeys = Journey.where("driverID_id == ?", current_user.id)
    @matches = Match.where("journeyID_id IN (?)", @journeys.ids)
    @contract_origins = ContractOrigin.where("matchID_id IN (?)", @matches.ids)
  end

  # GET /contract_origins/1
  # GET /contract_origins/1.json
  def show
  end

  # GET /contract_origins/new
  def new
    @match = Match.find(params[:matchID_id])
    @contract_origin = ContractOrigin.new
  end

  # GET /contract_origins/1/edit
  def edit
  end

  # POST /contract_origins
  # POST /contract_origins.json
  def create
    @contract_origin = ContractOrigin.new(contract_origin_params)
    @match = Match.find(@contract_origin.matchID_id)
    respond_to do |format|
      if @contract_origin.save
        format.html { redirect_to @contract_origin, notice: 'Contract origin was successfully created.' }
        format.json { render :show, status: :created, location: @contract_origin }
      else
        format.html { render :new }
        format.json { render json: @contract_origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_origins/1
  # PATCH/PUT /contract_origins/1.json
  def update
    respond_to do |format|
      if @contract_origin.update(contract_origin_params)
        format.html { redirect_to @contract_origin, notice: 'Contract origin was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract_origin }
      else
        format.html { render :edit }
        format.json { render json: @contract_origin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_origins/1
  # DELETE /contract_origins/1.json
  def destroy
    @contract_origin.destroy
    respond_to do |format|
      format.html { redirect_to contract_origins_url, notice: 'Contract origin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_origin
      @contract_origin = ContractOrigin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_origin_params
      params.require(:contract_origin).permit(:matchID_id, :isSigned_Driver, :isSigned_Sender, :origin_date, :comment)
    end
end
