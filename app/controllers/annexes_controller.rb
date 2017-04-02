class AnnexesController < ApplicationController
  before_action :set_annex, only: [:show, :edit, :update, :destroy]

  # GET /annexes
  # GET /annexes.json
  def index
    @annexes = Annex.all
  end

  # GET /annexes/1
  # GET /annexes/1.json
  def show
  end

  # GET /annexes/new
  def new
    @annex = Annex.new
  end

  # GET /annexes/1/edit
  def edit
  end

  # POST /annexes
  # POST /annexes.json
  def create
    @annex = Annex.new(annex_params)
    @annex.user_id = current_user
    @annex.document = params[:annex][:document]
    respond_to do |format|
      if @annex.save
        format.html { redirect_to @annex, notice: 'Anexo adicionado com sucesso.' }
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
    respond_to do |format|
      if @annex.update(annex_params)
        format.html { redirect_to @annex, notice: 'Annex was successfully updated.' }
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
    @annex.destroy
    respond_to do |format|
      format.html { redirect_to annexes_url, notice: 'Annex was successfully destroyed.' }
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
      params.require(:annex).permit(:lawsuit_id, :description, :document)
    end
end
