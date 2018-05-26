# Required for LTI
require 'ims/lti'
# Used to validate oauth signatures
require 'oauth/request_proxy/action_controller_request'

class ToolConsumersController < ApplicationController
  before_action :authenticate_admin!, :except => [:launch]
  before_action :set_tool_consumer, only: [:show, :edit, :update, :destroy]

  def launch

    # Search for a ToolConsumer with the param 'key' equal to :
    # the result of getting the 'parameters' array from inside the 'request' object.
    # The 'request' object is provided by Ruby on Rails and has many data about the request received from the user browser
    tc = ToolConsumer.find_by key:request.parameters['oauth_consumer_key']
    
    if tc.present?
      authenticator = IMS::LTI::Services::MessageAuthenticator.new(request.url, request.request_parameters, tc.secret)
    else
      render :launch_error, status: 401
      return
    end

    # Check if the signature is valid
    if !authenticator.valid_signature?
      render :launch_error, status: 401
      return
    end

    # Check if the request timestamp was 5 minutes ago
    if DateTime.strptime(request.request_parameters['oauth_timestamp'],'%s') < 5.minutes.ago
      render :launch_error, status: 401
      return
    end

    # The providre request is valid
    # store the values you need from the LTI
    # here we're just tossing them into the session
    session[:user_id] = params.require :user_id
    session[:lis_person_name_full] = params.require :lis_person_name_full

    # set variables for use by the template
    @lis_person_name_full = session[:lis_person_name_full]
    @tool_consumer = tc;
  end

  # GET /tool_consumers
  # GET /tool_consumers.json
  def index
    @tool_consumers = ToolConsumer.all
  end

  # GET /tool_consumers/1
  # GET /tool_consumers/1.json
  def show
  end

  # GET /tool_consumers/new
  def new
    @tool_consumer = ToolConsumer.new
  end

  # GET /tool_consumers/1/edit
  def edit
  end

  # POST /tool_consumers
  # POST /tool_consumers.json
  def create
    @tool_consumer = ToolConsumer.new(tool_consumer_params)

    respond_to do |format|
      if @tool_consumer.save
        format.html { redirect_to @tool_consumer, notice: 'Tool consumer was successfully created.' }
        format.json { render :show, status: :created, location: @tool_consumer }
      else
        format.html { render :new }
        format.json { render json: @tool_consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tool_consumers/1
  # PATCH/PUT /tool_consumers/1.json
  def update
    respond_to do |format|
      if @tool_consumer.update(tool_consumer_params)
        format.html { redirect_to @tool_consumer, notice: 'Tool consumer was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool_consumer }
      else
        format.html { render :edit }
        format.json { render json: @tool_consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tool_consumers/1
  # DELETE /tool_consumers/1.json
  def destroy
    @tool_consumer.destroy
    respond_to do |format|
      format.html { redirect_to tool_consumers_url, notice: 'Tool consumer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool_consumer
      @tool_consumer = ToolConsumer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_consumer_params
      params.require(:tool_consumer).permit(:name, :key, :secret)
    end
end
