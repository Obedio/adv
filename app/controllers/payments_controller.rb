class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :load_lawsuit, only: [:new, :create, :update]
  before_action :check_payment, only: [:new, :create]
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @lawsuit, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @lawsuit.update(payment_params)
        format.html { redirect_to @lawsuit, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @lawsuit }
      else
        format.html { render :edit }
        format.json { render json: @lawsuit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    #metodo para carregar o processo
    def load_lawsuit
      @lawsuit = Lawsuit.find(params[:lawsuit_id])
    end
    #metodo para validar o pagamento.
    def check_payment
      respond_to do |format|
      if (@lawsuit.amount_paid == @lawsuit.amount or @lawsuit.amount_paid == @lawsuit.amount)
        format.html { redirect_to @lawsuit, notice: 'Não pagamentos para serem realizados!' }
      else
        format.html { render :new }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount)
    end
  end
end