class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery with: :exception

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def profile_test
    @find = Profile.where(user_id: current_user.id)
    if @find.empty?
      respond_to do |format|
        format.html { redirect_to new_profile_path, notice: 'Por favor conclua seu cadastro.' }
      end
    end
  end
  
  def load_lawsuit
    @lawsuit = Lawsuit.find(params[:lawsuit_id])
  end
  
private
	
	def user_not_authorized
		flash[:notice] = "Você não tem permissão para ver isto."
		redirect_to(request.referrer || root_path)
	end
end