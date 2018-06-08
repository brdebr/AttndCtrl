class LtiContextsController < ApplicationController
  before_action :set_lti_context, only: [:show, :edit, :update, :destroy]

  # GET /lti_contexts
  # GET /lti_contexts.json
  def index
    @lti_contexts = LtiContext.all
  end

  # GET /lti_contexts/1
  # GET /lti_contexts/1.json
  def show
  end

  # GET /lti_contexts/new
  def new
    @lti_context = LtiContext.new
  end

  # GET /lti_contexts/1/edit
  def edit
  end

  # POST /lti_contexts
  # POST /lti_contexts.json
  def create
    @lti_context = LtiContext.new(lti_context_params)

    respond_to do |format|
      if @lti_context.save
        format.html { redirect_to @lti_context, notice: 'Lti context was successfully created.' }
        format.json { render :show, status: :created, location: @lti_context }
      else
        format.html { render :new }
        format.json { render json: @lti_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lti_contexts/1
  # PATCH/PUT /lti_contexts/1.json
  def update
    respond_to do |format|
      if @lti_context.update(lti_context_params)
        format.html { redirect_to @lti_context, notice: 'Lti context was successfully updated.' }
        format.json { render :show, status: :ok, location: @lti_context }
      else
        format.html { render :edit }
        format.json { render json: @lti_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lti_contexts/1
  # DELETE /lti_contexts/1.json
  def destroy
    @lti_context.destroy
    respond_to do |format|
      format.html { redirect_to lti_contexts_url, notice: 'Lti context was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lti_context
      @lti_context = LtiContext.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lti_context_params
      params.require(:lti_context).permit(:lti_id, :label, :title)
    end
end
