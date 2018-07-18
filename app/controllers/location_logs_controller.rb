class LocationLogsController < ApplicationController
  before_action :set_location_log, only: [:show, :edit, :update, :destroy]

  # GET /location_logs
  # GET /location_logs.json
  def index
    @location_logs = LocationLog.all
  end

  # GET /location_logs/1
  # GET /location_logs/1.json
  def show
  end

  # GET /location_logs/new
  def new
    @location_log = LocationLog.new
  end

  # GET /location_logs/1/edit
  def edit
  end

  # POST /location_logs
  # POST /location_logs.json
  def create
    @location_log = LocationLog.new(location_log_params)

    respond_to do |format|
      if @location_log.save
        format.html { redirect_to @location_log, notice: 'Location log was successfully created.' }
        format.json { render :show, status: :created, location: @location_log }
      else
        format.html { render :new }
        format.json { render json: @location_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_logs/1
  # PATCH/PUT /location_logs/1.json
  def update
    respond_to do |format|
      if @location_log.update(location_log_params)
        format.html { redirect_to @location_log, notice: 'Location log was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_log }
      else
        format.html { render :edit }
        format.json { render json: @location_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_logs/1
  # DELETE /location_logs/1.json
  def destroy
    @location_log.destroy
    respond_to do |format|
      format.html { redirect_to location_logs_url, notice: 'Location log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_log
      @location_log = LocationLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_log_params
      params.require(:location_log).permit(:latitude, :longitude, :position_time)
    end
end
