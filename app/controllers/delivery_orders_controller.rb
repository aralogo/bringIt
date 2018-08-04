class DeliveryOrdersController < ApplicationController
  before_action :set_delivery_order, only: [:show, :edit, :update, :destroy]

  # GET /delivery_orders
  # GET /delivery_orders.json
  def index
    @delivery_orders = DeliveryOrder.all
  end
  
  #to list the deliveries for that user
  def indexUser
    #to show a list of the matches for the user
    @journeys = Journey.where("driverID_id == ?", current_user.id)
    @matches = Match.where("journeyID_id IN (?)", @journeys.ids)
    @delivery_orders = DeliveryOrder.where("matchID_id IN (?)", @matches.ids)
  end

  # GET /delivery_orders/1
  # GET /delivery_orders/1.json
  def show
  end

  # GET /delivery_orders/new
  def new
    @match = Match.find(params[:matchID_id])
    @delivery_order = DeliveryOrder.new
  end
  

  # GET /delivery_orders/1/edit
  def edit
  end

  # POST /delivery_orders
  # POST /delivery_orders.json
  def create
    @delivery_order = DeliveryOrder.new(delivery_order_params)
    @match = Match.find(@delivery_order.matchID_id)
    
    respond_to do |format|
      if @delivery_order.save
        format.html { redirect_to @delivery_order, notice: 'Delivery order was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_order }
      else
        format.html { render :new }
        format.json { render json: @delivery_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_orders/1
  # PATCH/PUT /delivery_orders/1.json
  def update
    respond_to do |format|
      if @delivery_order.update(delivery_order_params)
        format.html { redirect_to @delivery_order, notice: 'Delivery order was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_order }
      else
        format.html { render :edit }
        format.json { render json: @delivery_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_orders/1
  # DELETE /delivery_orders/1.json
  def destroy
    @delivery_order.destroy
    respond_to do |format|
      format.html { redirect_to delivery_orders_url, notice: 'Delivery order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_order
      @delivery_order = DeliveryOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_order_params
      params.require(:delivery_order).permit(:matchID_id, :isSigned_Driver, :isSigned_Receiver, :destiny_date, :comment)
    end
end
