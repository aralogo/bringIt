class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy, :authenticate_admin!]
  before_action :authenticate_admin!, only: [ :index, :new, :edit, :update, :destroy]
  
  # GET /journeys
  # GET /journeys.json
  def index
    @journeys = Journey.all
    # @origin = Location.find(@journey.origin)
    # @i1 = Location.find(@journey.intermediate1_id)
    # @i2 = Location.find(@journey.intermediate2_id)
    # @i3 = Location.find(@journey.intermediate3_id)
    # @destiny = Location.find(@journey.destiny)
    
  end

  # GET /journeys/1
  # GET /journeys/1.json
  def show
    @journey.user = User.find(@journey.driverID_id)
  end

  # GET /journeys/new
  def new
    @journey = Journey.new
    @journey.origin = Location.new
    @journey.build_intermediate1
    @journey.build_intermediate2
    @journey.build_intermediate3
    @journey.destiny = Location.new
    # @journeyDriver = User.find(current_user.id)
    @users = User.all
    # puts "!!!!!!!!!!!!!!!!!!#{@journeyDriver.id}"
  end

  # GET /journeys/1/edit
  def edit
    if @journey.intermediate1_id.nil?
      @journey.build_intermediate1
    end
    if @journey.intermediate2_id.nil?
      @journey.build_intermediate2
    end
    if @journey.intermediate3_id.nil?
      @journey.build_intermediate3
    end
  end
  
  def search 
    # @search_keyw = params[:q]
    
    @origin = "%#{params[:origin]}%"  
    @destiny = "%#{params[:destiny]}%"
    @date = "%#{params[:origin_date]}%"
    
    
    
    if ((@origin != "%%") and (@destiny == "%%"))
      @location_ids = Location.where("city like ?", @origin)
      @journeys = Journey.where("origin_id IN (?) or intermediate1_id IN (?) or intermediate2_id IN (?) or intermediate3_id IN (?) ", @location_ids.ids, @location_ids.ids, @location_ids.ids, @location_ids.ids)
    elsif ((@origin == "%%") and (@destiny != "%%"))
      @location_ids = Location.where("city like ?", @destiny)
      puts "-------------- #{@location_ids.ids} ---------------"
      @journeys = Journey.where(" (intermediate1_id IN (?)) or (intermediate2_id IN (?)) or (intermediate3_id IN (?)) or (destiny_id IN (?)) ", @location_ids.ids, @location_ids.ids, @location_ids.ids, @location_ids.ids)
    elsif ((@origin != "%%") and (@destiny !=  "%%"))
      @O_ids = Location.where("city like ?", @origin)
      @D_ids = Location.where("city like ?", @destiny)
      puts "-------O------- #{@O_ids}"
      puts "-------D------- #{@D_ids}"
      @journeys = Journey.where( "origin_id IN (?) and destiny_id IN (?)" , @O_ids.ids, @D_ids.ids)
      
      # if O is ori then D can be i1,i2,i3 or des
      # if O is i1 then D can be i2,i3 or des
      # if O is i2 then D can be i3 or des
      # if O is i3 then D can be des
      # visualise all the possibilities
      
    end
  end

  # POST /journeys
  # POST /journeys.json
  def create
    @journey = Journey.new(journey_params)

    respond_to do |format|
      if @journey.save
        format.html { redirect_to @journey, notice: 'Journey was successfully created.' }
        format.json { render :show, status: :created, location: @journey }
      else
        format.html { render :new }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journeys/1
  # PATCH/PUT /journeys/1.json
  def update
    respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to @journey, notice: 'Journey was successfully updated.' }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journeys/1
  # DELETE /journeys/1.json
  def destroy
    @journey.destroy
    respond_to do |format|
      format.html { redirect_to journeys_url, notice: 'Journey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journey
      @journey = Journey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journey_params
      params.require(:journey).permit(:origin_id, :intermediate1_id, :intermediate2_id, :intermediate3_id, :destiny_id, :originTime, :destinyTime, :driverID_id, :priceTotal, :price01, :price12, :price23, origin_attributes:[:id, :address1, :address2, :city, :county, :country, :_destroy], intermediate1_attributes:[:id, :address1, :address2, :city, :county, :country, :_destroy], intermediate2_attributes:[:id, :address1, :address2, :city, :county, :country, :_destroy], intermediate3_attributes:[:id, :address1, :address2, :city, :county, :country, :_destroy], destiny_attributes:[:id, :address1, :address2, :city, :county, :country, :_destroy])
    end
    
    def authenticate_admin!
      if current_user
        # the user is signed in
        if !current_user.isAdmin?
          # registered user but not an admin!
            if params[:id].present?  #check for the case that try to go to index (for gral display)
              unless @journey.driverID_id == current_user.id
              #trying crud in not your things 
                flash[:notice] = 'Access denied as you are not owner of this data'
                redirect_to root_path 
              end 
            else
              flash[:notice] = 'You are not admin!!'
                redirect_to root_path 
            end
        end
      else
        redirect_to :new_user_session
        flash[:notice] = 'You need to login to continue'
      end
    end
    
    
end
