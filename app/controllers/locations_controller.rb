class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @user = User.find(params[:user_id])
    @locations = @user.locations
    @read_more = params[:read_more]
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @user = User.find(params[:user_id])
    @location = @user.locations.build
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @user = User.find(params[:user_id])
    @location = @user.locations.new(location_params)#Location.new(location_params)
    params.inspect
    #@location = Location.new(loc: params[:loc], journal: params[:journal])
    @user.locations << @location
    #@location = Location.new(location_params)
    respond_to do |format|
      if @location.save
        format.html { redirect_to @user, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @user.locations.where(:_id => params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @user = User.find(params[:user_id])
      @location = @user.locations.where(:_id => params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:loc, :date, :journal, :user_id, :commit)
    end
end
