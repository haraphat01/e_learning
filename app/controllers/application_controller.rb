class ApplicationController < ActionController::Base
    protect_from_forgery
    include Pundit
    before_action :authenticate_user!
    include PublicActivity::StoreController #save current_user using gem public_activity
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    after_action :user_activity
    include Pagy::Backend 

    private

    def user_activity
      current_user.try :touch
    end
  
    def user_not_authorized #pundit
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

end
