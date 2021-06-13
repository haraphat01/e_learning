class HomeController < ApplicationController
  def index
    @courses = Course.all.limit(3)
    @recent = Course.all.limit(3).order(created_at: :desc )
  end
end
