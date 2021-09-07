class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).all
    end
  end

  def show?
    owner_or_admin?
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  def new_product?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    # record ==> @list
    record.user == user || user.admin
  end
end
