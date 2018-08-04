class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [ :index, :new, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end
  
  #to list the ones for the user to create a contract
  def indexUser
    #to show a list of the matches for the user
    @journeys = Journey.where("driverID_id == ?", current_user.id)
    @matches = Match.where("journeyID_id IN (?)", @journeys.ids)
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    
  end
  
  def newMatchfromJourney
    @match = Match.new
    
    @journey = Journey.find(params[:id])
    @packages = Package.where("user_id == ? and status == 'pending'", @journey.driverID_id)
  end

  # GET /matches/1/edit
  def edit
  end
  
  def payMatch
    update_attribute
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    @package = Package.find (@match.packageID_id)
   
    
    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :payMatch, status: :created, location: @match }
        # to change the status of the package that already have a ride
        @package.update_attribute(:status, "matched")
        @package.save
      else
        format.html { render :newMatchfromJourney }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @package = Package.find (@match.packageID_id)
    @match.destroy
    
    #add to cancel payment (paypal returns)
    
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
      # change the status of the package to be available to be matched
      @package.update_attribute(:status, "pending")
      @package.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:journeyID_id, :origin_id, :destiny_id, :originTime, :destinyTime, :packageID_id, :acceptTime, :price)
    end
    
    def authenticate_admin!
      if current_user
        # the user is signed in
        if !current_user.isAdmin?
          # registered user but not an admin!
            if params[:id].present?  #check for the case that try to go to index (for gral display)
             # get driver
              theJourney = Journey.find(@match.journeyID_id)
              #get sender
              thePackage = Package.find(@match.packageID_id)
              unless (theJourney.driverID_id == current_user.id) or (thePackage.user_id == current_user.id)
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
