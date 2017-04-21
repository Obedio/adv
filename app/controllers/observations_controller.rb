class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update]
  before_action :authenticate_user!, :profile_test
  before_action :load_lawsuit, only: [:new, :create]

  def index
    @observations = Observation.all.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @observation = Observation.new
  end

  def edit
  end

  def create
    @observation = @lawsuit.observations.new(observation_params)
    @observation.user_id = current_user.id
    respond_to do |format|
      if @observation.save
        format.html { redirect_to @lawsuit, notice: 'Comentário Realizado.' }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    @observation.user_id = current_user.id
    respond_to do |format|
    if @observation.update(observation_params)
      format.html { redirect_to lawsuit_path(Lawsuit.find(@observation.lawsuit_id)), notice: 'Comentário Atualizado.' }
      format.json { render :show, status: :ok, location: @observation }
    else
      format.html { render :edit }
      format.json { render json: @observation.errors, status: :unprocessable_entity }
    end
  end
  end

  private
    def set_observation
      @observation = Observation.find(params[:id])
    end

    def observation_params
      params.require(:observation).permit(:description)
    end
end
