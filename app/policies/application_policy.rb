#add pundit to Gemfile and bundle. 
#This file was generated with (rails g pundit:install)
# (include Pundit) in the application controlller in order to use its methods. 
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.present?
  end

  def show?
    update?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.public || user.admin? || record.user == user || record.collaborators.pluck(:user_id).include?(user.id))
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

