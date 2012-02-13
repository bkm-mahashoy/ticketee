class ProjectsController < ApplicationController

  before_filter :authorize_admin!, except: [:index, :show]
  before_filter :authenticate_user!, only: [:index, :show]
  before_filter :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.for(current_user).all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        flash[:alert] = 'Project has not been created.'
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tickets = @project.tickets

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project has been successfully updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render action: :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project has been successfully deleted."
    redirect_to projects_path
  end

  private

  def find_project
    begin
      @project = Project.for(current_user).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project could not be found."
      redirect_to projects_path
    end
  end
end
