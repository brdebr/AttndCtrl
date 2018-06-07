class LtiUsersController < ApplicationController
  before_action :set_lti_user, only: [:show, :edit, :update, :destroy]

  # GET /lti_users
  # GET /lti_users.json
  def index
    @lti_users = LtiUser.all
  end

  # GET /lti_users/1
  # GET /lti_users/1.json
  def show
  end

  # GET /lti_users/new
  def new
    @lti_user = LtiUser.new
  end

  # GET /lti_users/1/edit
  def edit
  end

  # POST /lti_users
  # POST /lti_users.json
  def create
    @lti_user = LtiUser.new(lti_user_params)

    respond_to do |format|
      if @lti_user.save
        format.html { redirect_to @lti_user, notice: 'Lti user was successfully created.' }
        format.json { render :show, status: :created, location: @lti_user }
      else
        format.html { render :new }
        format.json { render json: @lti_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lti_users/1
  # PATCH/PUT /lti_users/1.json
  def update
    respond_to do |format|
      if @lti_user.update(lti_user_params)
        format.html { redirect_to @lti_user, notice: 'Lti user was successfully updated.' }
        format.json { render :show, status: :ok, location: @lti_user }
      else
        format.html { render :edit }
        format.json { render json: @lti_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lti_users/1
  # DELETE /lti_users/1.json
  def destroy
    @lti_user.destroy
    respond_to do |format|
      format.html { redirect_to lti_users_url, notice: 'Lti user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lti_user
      @lti_user = LtiUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lti_user_params
      params.require(:lti_user).permit(:full_name, :given, :family, :username, :email)
    end
end
