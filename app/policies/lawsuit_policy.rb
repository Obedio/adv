class LawsuitPolicy < ApplicationPolicy
  
  def show?
  	user.admin? or scope.where(:id => record.id).exists?
 	end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user)
      end
    end
  end
end
