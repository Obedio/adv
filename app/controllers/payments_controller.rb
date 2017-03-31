class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show]
  before_action :authenticate_user!
  before_action :load_lawsuit, only: [:new, :create]
  
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all.paginate(page: params[:page], per_page: 2)
   # @id = Payment.first.lawsuit_id
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    a = @lawsuit.amount
    b = @lawsuit.amount_paid
    if a > b
    @payment = Payment.new
    else
      respond_to do |format|
        format.html { redirect_to @lawsuit, notice: 'Não há mais pagamentos para realizar. Parabéns!!!' }
      end
    end
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = @lawsuit.payments.new(payment_params)
    value = @lawsuit.amount_paid + @payment.amount
    respond_to do |format|
      if @payment.save && @lawsuit.update(amount_paid: value)
        format.html { redirect_to @lawsuit, notice: 'Pagamento Realizado.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    #metodo para carregar o processo
    def load_lawsuit
      @lawsuit = Lawsuit.find(params[:lawsuit_id])
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