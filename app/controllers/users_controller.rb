class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @admins = User.admins
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: (t :successful_user_creation) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    parameters = user_params_updating

    if !(@user.authenticate parameters["current_password"])
      @user.errors.add(:password, (t :no_match))
    else
      @user.password = parameters["password"]
      @user.password_confirmation = parameters["password_confirmation"]
    end

    respond_to do |format|
      unless @user.errors.any?
        parameters.delete "current_password"

        if @user.update(parameters)
          format.html { redirect_to @user, notice: (t :successful_user_update) }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { redirect_to :back, flash: { :errors => @user.errors.full_messages }  }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to :back, flash: { :errors => @user.errors.full_messages }  }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def user_params_updating
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end
end
