class DataUsersController < ApplicationController
  before_action :set_data_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /data_users
  # GET /data_users.json
  def index
    @data_users = DataUser.all
  end

  # GET /data_users/1
  # GET /data_users/1.json
  def show
  end

  # GET /data_users/new
  def new
    @data_user = DataUser.new
  end

  # GET /data_users/1/edit
  def edit
  end

  # POST /data_users
  # POST /data_users.json
  def create
    @data_user = DataUser.new(data_user_params)
    @data_user.user_id = current_user.id
    respond_to do |format|
      if @data_user.save
        format.html { redirect_to @data_user, notice: 'Data user was successfully created.' }
        format.json { render :show, status: :created, location: @data_user }
      else
        format.html { render :new }
        format.json { render json: @data_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_users/1
  # PATCH/PUT /data_users/1.json
  def update
    respond_to do |format|
      if @data_user.update(data_user_params)
        format.html { redirect_to @data_user, notice: 'Data user was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_user }
      else
        format.html { render :edit }
        format.json { render json: @data_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_users/1
  # DELETE /data_users/1.json
  def destroy
    @data_user.destroy
    respond_to do |format|
      format.html { redirect_to data_users_url, notice: 'Data user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_user
      @data_user = DataUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_user_params
      params.require(:data_user).permit(:name, :born, :sex, :office_id)
    end
end
