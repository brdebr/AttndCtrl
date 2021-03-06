class ToolConsumers::TimetablesController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]
  before_action :set_tool_consumer, except: [:new, :create]

  # GET /timetables
  # GET /timetables.json
  def index
    @timetables = Timetable.all
  end

  # GET /timetables/1
  # GET /timetables/1.json
  def show
    @new_timetable_u = TimetableUnit.new
    @new_timetable_u.timetable = @timetable
    gon.clear
    if TimetableUnit.find_by(timetable_id:@timetable).nil?
      @timetable_u = TimetableUnit.new
    else
      @timetable_u = TimetableUnit.find_by timetable_id:@timetable.id
      @new_timetable_u = TimetableUnit.new
      gon.timetable_u = @timetable_u
    end
    gon.timetable_id = @timetable.id

  end

  # GET /timetables/new
  def new
    @timetable = Timetable.new
    @tool_consumer = ToolConsumer.find_by id:params['tool_consumer_id'], admin:current_admin
    if @tool_consumer.nil?
      render file: 'public/404', status: :not_found
    end
  end

  # GET /timetables/1/edit
  def edit
  end

  # POST /timetables
  # POST /timetables.json
  def create
    @timetable = Timetable.new(timetable_params)
    @timetable.tool_consumer = ToolConsumer.find_by id:params['tool_consumer_id'], admin:current_admin
    if @timetable.tool_consumer.nil?
      render file: 'public/404', status: :not_found
    end

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to @timetable.tool_consumer, notice: 'Timetable was successfully created.' }
        format.json { render :show, status: :created, location: @timetable }
      else
        format.html { render :new }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetables/1
  # PATCH/PUT /timetables/1.json
  def update
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.html { redirect_to @timetable, notice: 'Timetable was successfully updated.' }
        format.json { render :show, status: :ok, location: @timetable }
      else
        format.html { render :edit }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetables/1
  # DELETE /timetables/1.json
  def destroy
    @timetable.destroy
    respond_to do |format|
      format.html { redirect_to @tool_consumer, notice: 'Timetable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    def set_tool_consumer
      @tool_consumer = ToolConsumer.find_by id:@timetable.tool_consumer.id, admin:current_admin
      if @tool_consumer.nil?
        render file: 'public/404', status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timetable_params
      params.require(:timetable).permit(:name)
    end
end
