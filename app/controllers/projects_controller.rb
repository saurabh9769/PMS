class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project ,only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /projects
  # GET /projects.json
  def index
    # binding.pry
    # @projects = current_user.projects
    if params[:search]
      @projects = current_user.projects.search(params[:search]).order("created_at DESC").page(params[:page])
    else
      @projects = current_user.projects.order('created_at ASC').page(params[:page])
    end
    # @projects = Project.all
    # @projects = Project.order(:name).
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    # binding.pry
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @users = User.all
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create

        # binding.pry
    @project = current_user.projects.create(project_params)
    # binding.pry
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:uid, :name, :description, :start_date, :end_date)
    end

end
