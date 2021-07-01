class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @courses = Course.all.limit(3)
    @recent = Course.all.limit(3).order(created_at: :desc )
  end

  # notifications_controller.rb
def activity
  @activities = PublicActivity::Activity.all
end

end
