class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :profile_test
  before_action :set_lawsuit, only: [:show]

  def index
    @q = Client.ransack(params[:q])
    if params[:q]
      @clients = @q.result
      @clients = policy_scope(@clients).paginate(page: params[:page], per_page: 10)
      if @clients == []
        respond_to do |format|
            format.html { redirect_to clients_url, notice: 'Não foi encontrado.' }
        end
      end
    else
      @clients = policy_scope(Client).paginate(page: params[:page], per_page: 10)

      respond_to do |format|
        format.html
        format.pdf do
          pdf = ClientPdf.new(@clients, "Meus Clientes")
          send_data pdf.render, filename: "lista.pdf", type: "application/pdf", disposition: "inline"
        end
      end
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    authorize @client
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.build_address
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente Cadastrado com Sucesso.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    authorize @client
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Cliente Atualizado com Sucesso.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    authorize @client
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente Excluído com Sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_lawsuit
      @lawsuit = Lawsuit.where(client_id: params[:id]).order("status_id ASC").paginate(page: params[:page], per_page: 8)
    end
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :lastname, :born, :sex, :cpf, :rg, :email, :telephone, 
        :celphone, :bio, address_attributes: [:street, :district, :city, :state, :zipcode, :addresstype])
    end
end
