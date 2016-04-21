class UsersController < ApplicationController

  def index
    @users = User.all

  	data = User.where(["email LIKE ?", "%#{params[:q]}%"]).limit(params[:page_limit]).
           collect { |user| {:id => user.id,
                             :name => user.email} }

  	render json:{success: true, :results => data}
  end
end
