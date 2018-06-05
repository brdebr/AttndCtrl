class TimetableUnitsController < ApplicationController

  # GET /timetable_us
  # GET /timetable_us.json
  def index
    @timetable_u = TimetableUnit.all

    respond_to do |format|
      format.html
      format.json { render :json => @timetable_u }
    end
  end

  # GET /timetable_us/1
  # GET /timetable_us/1.json
  def show
  end

  # GET /timetable_us/new
  def new
    @timetable_u = TimetableUnit.new
  end

  # GET /timetable_us/1/edit
  def edit
  end

  # POST /timetable_us
  # POST /timetable_us.json
  def create
    @timetable_u = TimetableUnit.new(timetable_u_params) ##
    respond_to do |format|
      if @timetable_u.save
        format.json { render :show, status: :created, location: @timetable_u }
      else
        format.json { render json: @timetable_u.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetable_us/1
  # PATCH/PUT /timetable_us/1.json
  def update

    respond_to do |format|
      if @timetable_u.update(timetable_u_params)
        format.json { render :show, status: :ok, location: @timetable_u }
      else
        format.json { render json: @timetable_u.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /timetable_us/1
  # DELETE /timetable_us/1.json
  def destroy
    @timetable_u.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_timetable_u
    @timetable_u = TimetableUnit.find(params[:id])
  end

  def set_tool_consumer
    @tool_consumer = ToolConsumer.find_by id:@timetable_u.tool_consumer.id, admin:current_admin
    if @tool_consumer.nil?
      render file: 'public/404', status: :not_found
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timetable_u_params
    params.require(:timetable_u).permit(:name)
  end
end


