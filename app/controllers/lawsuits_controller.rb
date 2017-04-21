class LawsuitsController < ApplicationController
  before_action :authenticate_user!, :profile_test
  before_action :set_lawsuit, only: [:show, :edit, :update, :destroy]
  before_action :load_client, only: [:new, :create]
  before_action :load_observation, :load_payment, :load_annex, :load_share, only: [:show, :destroy]

  def index
    @q = Lawsuit.ransack(params[:q])
    if params[:q]
      @lawsuits = @q.result
      @lawsuits = policy_scope(@lawsuits).paginate(page: params[:page], per_page: 1)
      if @lawsuits == []
        respond_to do |format|
            format.html { redirect_to lawsuits_url, notice: 'Não foi encontrado.' }
        end
      end
    else
    @lawsuits = policy_scope(Lawsuit).order("status_id ASC").paginate(page: params[:page], per_page: 8)
    end
  end

  def show
    @define_author_a = Share.where(lawsuit_id: @lawsuit.id)
    @define_author_b = @define_author_a.where(email: current_user.email)
    if @define_author_b != []
      true
    else
      authorize @lawsuit
    end
  end

  def new
    @lawsuit = Lawsuit.new
  end

  def edit
  end

  def create
    @lawsuit = @client.lawsuits.new(lawsuit_params)
    @lawsuit.user_id = current_user.id
    @lawsuit.amount_paid = 0
    @lawsuit.amount_rest = @lawsuit.amount
    respond_to do |format|
      if @lawsuit.save
        format.html { redirect_to @lawsuit, notice: 'Processo Cadastrado com Sucesso.' }
        format.json { render :show, status: :created, location: @lawsuit }
      else
        format.html { render :new }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @lawsuit
    @lawsuit.amount_rest = @lawsuit.amount - @lawsuit.amount_paid
    respond_to do |format|
      if @lawsuit.update(lawsuit_params)
        format.html { redirect_to @lawsuit, notice: 'Processo Atualizado com Sucesso.' }
        format.json { render :show, status: :ok, location: @lawsuit }
      else
        format.html { render :edit }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @lawsuit
    @lawsuit.destroy
    respond_to do |format|
      format.html { redirect_to lawsuits_path, notice: 'Processo Excluído com Sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def load_payment
      @payment = Payment.where(lawsuit_id: params[:id]).order("created_at DESC").paginate(page: params[:page], per_page: 1)
    end
    def load_observation
      @observation = Observation.where(lawsuit_id: params[:id]).order("created_at DESC").paginate(page: params[:param_name], per_page: 2)
    end

    def load_annex
      @annex = Annex.where(lawsuit_id: params[:id]).order("created_at DESC").paginate(page: params[:param_name], per_page: 8)
    end
    def load_share
      @share = Share.where(lawsuit_id: params[:id]).order("created_at DESC").paginate(page: params[:param_name], per_page: 8)
    end
    
    def load_client
      @client = Client.find(params[:client_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_lawsuit
      @lawsuit = Lawsuit.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_params
      params.require(:lawsuit).permit(:number, :assessment, :description, :amount, :venue_id, :kind_id, :status_id)
    end
end
