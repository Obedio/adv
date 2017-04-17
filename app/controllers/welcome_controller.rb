class WelcomeController < ApplicationController
    before_action :authenticate_user!
    before_action :profile_test
    def index
  	    @lawsuits = policy_scope(Lawsuit).where(status_id: 1).paginate(page: params[:page], per_page: 8) 
    end
  
    def profile_test
        @find = Profile.where(user_id: current_user.id)
        if @find.empty?
            respond_to do |format|
                format.html { redirect_to new_profile_path, notice: 'Por favor conclua seu cadastro.' }
            end
        end
    end
  
end
