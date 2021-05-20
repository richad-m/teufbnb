class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    index?
  end

  # def new?
  #   true
  # end

  # def create?
  #   new?
  # end

  # def edit?
  #   @record.user_id == user.id
  # end

  # def update?
  #   edit?
  #   # - record: the restaurant passed to the `authorize` method in controller
  #   # - user:   the `current_user` signed in with Devise.
  # end

  # def destroy?
  #   owner?
  # end
end
