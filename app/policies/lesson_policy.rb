class LessonPolicy < ApplicationPolicy
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
      def edit?
        @record.course.user_id == @user_id
      end
    
      def create?
        # @user.has_role?:teacher 
      end
    
      def new?
        # @user.has_role?:teacher 
      end
    
      def update?
        @record.course.user_id == @user_id
      end
    
      def edit?
        @user.has_role?:admin || @record.user = @user
      end
    
      def destroy?
        @record.course.user_id == @user_id
      end
    
    end
  end
  