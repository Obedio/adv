class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :profile_test
  before_action :load_lawsuit, only: [:new, :create]
 
  def index
    @shares = Share.where(email: current_user.email)
  end

  def show
  end

  def new
    @share = Share.new
  end

  def edit
  end

  def create
    @share = @lawsuit.shares.new(share_params)
    @find_user = User.where(email: @share.email)
    @find_share = Share.where(lawsuit_id: @share.lawsuit_id)
    @already = @find_share.where(email: @share.email)
    if @find_user == []
      respond_to do |format|
        format.html { redirect_to new_lawsuit_share_path, notice: 'Email não encontrado, faça novamente.' }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    elsif @already == []
      respond_to do |format|
        if @share.save
          format.html { redirect_to @lawsuit, notice: 'Compartilhado com sucesso.' }
          format.json { render :show, status: :created, location: @share }
        else
          format.html { render :new, notice: 'Email não encontrado, faça novamente.' }
          format.json { render json: @share.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to lawsuit_path(@share.lawsuit_id), notice: 'Este processo já está compartilhado com o email.' }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
        format.json { render :show, status: :ok, location: @share }
      else
        format.html { render :edit }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to lawsuit_path(@share.lawsuit_id), notice: 'Excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_share
      @share = Share.find(params[:id])
    end

    def share_params
      params.require(:share).permit(:email)
    end
end
