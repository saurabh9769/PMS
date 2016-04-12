class MilestonesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  # GET /milestones
  # GET /milestones.json
  def index
    # binding.pry
    # @milestones = current_user.milestones
    @project = Project.find(params[:project_id])
    @q = Milestone.ransack(params[:q])
    @q.result.includes(:name).page(params[:page])


    if params[:search]
      @milestones = @project.milestones.search(params[:search]).order("created_at DESC").page(params[:page])
    else
      @milestones = @project.milestones.order('created_at ASC').page(params[:page])
    end
      
  # @milestones = @q.result.includes(:name).page(params[:page])
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
    @milestone = Milestone.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  # GET /milestones/new
  def new
    @milestone = Milestone.new
    @project = Project.find(params[:project_id])
  end

  # GET /milestones/1/edit
  def edit
    @milestone = Milestone.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  # POST /milestones
  # POST /milestones.json
  def create

    @project = Project.find(params[:project_id])
    # binding.pry
    @milestone = @project.milestones.create(milestone_params)

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to project_milestones_path, notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestones/1
  # PATCH/PUT /milestones/1.json
  def update
    @project = Project.find(params[:project_id])
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to project_milestone_path, notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    # binding.pry
    @project = Project.find(params[:project_id])
    @milestone.destroy
    respond_to do |format|
      format.html { redirect_to project_milestones_path, notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_params
      params.require(:milestone).permit( :name, :description, :start_date, :end_date)
    end
end
