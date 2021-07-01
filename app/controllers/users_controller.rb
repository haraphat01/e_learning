class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
    @q = Person.ransack(params[:q])
    @people = @q.result(distinct: true)
  end
end