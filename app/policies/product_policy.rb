class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    owner_or_admin?
  end

  def create?
    true
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    # record ==> @product
    record.user == user || user.admin
  end
end
