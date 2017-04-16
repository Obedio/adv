class AnnexPolicy < ApplicationPolicy
	def show?
  	user.admin? or scope.where(:id => record.id).exists?
  end
  def update?
    user.admin? or scope.where(:id => record.id).exists?
  end
  def destroy?
    user.admin? or scope.where(:id => record.id).exists?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
