class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.manager?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    user.admin? || user.manager?
  end

  def show?
    user.admin? || user.manager? || record.id == user.id
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? || record.id == user.id
  end

  def destroy?
    user.admin?
  end
end
