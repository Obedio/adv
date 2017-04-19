class AnnexesController < ApplicationController
  before_action :set_annex, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :profile_test
  before_action :load_lawsuit, only: [:new, :create]
  # GET /annexes
  # GET /annexes.json
  def index
    @annexes = Annex.all
  end

  # GET /annexes/1
  # GET /annexes/1.json
  def show
    authorize @annex
  end

  # GET /annexes/new
  def new
    @annex = Annex.new
    @annex.document = params[:file]
  end

  # GET /annexes/1/edit
  def edit
  end

  # POST /annexes
  # POST /annexes.json
  def create
    @annex = @lawsuit.annexes.new(annex_params)
    @annex.user_id = current_user.id
    respond_to do |format|
      if @annex.save
        @annex.document.url
        @annex.document.current_path
        @annex.document_identifier
        format.html { redirect_to @lawsuit, notice: 'Arquivo adicionado com sucesso.' }
        format.json { render :show, status: :created, location: @annex }
      else
        format.html { render :new }
        format.json { render json: @annex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annexes/1
  # PATCH/PUT /annexes/1.json
  def update
    authorize @annex
    respond_to do |format|
      if @annex.update(annex_params)
        format.html { redirect_to lawsuit_path(Lawsuit.find(@annex.lawsuit_id)), notice: 'Arquivo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @annex }
      else
        format.html { render :edit }
        format.json { render json: @annex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annexes/1
  # DELETE /annexes/1.json
  def destroy
    authorize @annex
    id = Lawsuit.find(@annex.lawsuit_id)
    @annex.destroy
    respond_to do |format|
      format.html { redirect_to lawsuit_path(id), notice: 'Arquivo excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annex
      @annex = Annex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annex_params
      params.require(:annex).permit(:description, :document)
    end
end
