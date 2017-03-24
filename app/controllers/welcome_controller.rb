class WelcomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@lawsuits = Lawsuit.where(status_id: 1).paginate(page: params[:page], per_page: 8) 
  end
end
