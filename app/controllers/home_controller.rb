class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@users = User.all
  	# @project = Project.find(params[:project_id])
  	# @milestone = Milestone.find(params[:milestone_id])
  	# @task = Task.find(params[:task_id])
  end
end
