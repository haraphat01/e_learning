class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      false
    end
  
    # def show?
    #   false
    # end
  
    def create?
      @user.has_role?:admin
    end
  
    def new?
      @user.has_role?:teacher || admin
    end
  
    def update?
      @user.has_role?:admin || @record.user = @user
    end
  
    def edit?
      @user.has_role?:admin || @record.user = @user
    end
  
    def destroy?
      @user.has_role?:admin || @record.user = @user
    end
  
  end
end
