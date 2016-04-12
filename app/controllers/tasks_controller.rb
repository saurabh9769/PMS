class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    # @tasks = current_milestone.tasks
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
    
    if params[:search]
      @tasks = @milestone.tasks.search(params[:search]).order("created_at DESC").page(params[:page])
    else
      @tasks = @milestone.tasks.order('created_at ASC').page(params[:page])
    end

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
  end

  # GET /tasks/new
  def new
    # binding.pry
    @task = Task.new
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
    @task = @milestone.tasks.create(task_params)
    # @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_milestone_task_path(project_id: @project.id , milestone_id: @milestone.id , id: @task.id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_milestone_tasks_path(project_id: @project.id , milestone_id: @milestone.id), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_milestone
      @milestone = Milestone.find(params[:milestone_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :start_date, :end_date, :status)
    end
end
