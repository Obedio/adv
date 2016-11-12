class StatusPaymentsController < ApplicationController
  before_action :set_status_payment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /status_payments
  # GET /status_payments.json
  def index
    @status_payments = StatusPayment.all
  end

  # GET /status_payments/1
  # GET /status_payments/1.json
  def show
  end

  # GET /status_payments/new
  def new
    @status_payment = StatusPayment.new
  end

  # GET /status_payments/1/edit
  def edit
  end

  # POST /status_payments
  # POST /status_payments.json
  def create
    @status_payment = StatusPayment.new(status_payment_params)

    respond_to do |format|
      if @status_payment.save
        format.html { redirect_to @status_payment, notice: 'Status payment was successfully created.' }
        format.json { render :show, status: :created, location: @status_payment }
      else
        format.html { render :new }
        format.json { render json: @status_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_payments/1
  # PATCH/PUT /status_payments/1.json
  def update
    respond_to do |format|
      if @status_payment.update(status_payment_params)
        format.html { redirect_to @status_payment, notice: 'Status payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_payment }
      else
        format.html { render :edit }
        format.json { render json: @status_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_payments/1
  # DELETE /status_payments/1.json
  def destroy
    @status_payment.destroy
    respond_to do |format|
      format.html { redirect_to status_payments_url, notice: 'Status payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_payment
      @status_payment = StatusPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_payment_params
      params.require(:status_payment).permit(:name)
    end
end
