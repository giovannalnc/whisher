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
    true
  end

  def create?
    #user.lists.include?(record.list)
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
