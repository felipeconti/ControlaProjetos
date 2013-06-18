class TasksController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :find_project

  def index
    @tasks = @project.tasks.all
    respond_with(@tasks)
  end

  def show
    @task = @project.tasks.find(params[:id])
    respond_with(@task)
  end

  def detail
    @task = @project.tasks.find(params[:id])
    respond_with(@task)
  end

  def new
    @task = @project.tasks.new
    respond_with(@task)
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def create
    @task = @project.tasks.new(params[:task])
    @task.owner_id = current_user.id
    @task.save
    respond_with(@task, location: customer_project_path(@customer, @project))
  end

  def update
    @task = @project.tasks.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with(@task, location: customer_project_path(@customer, @project))
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
    respond_with(@task, location: customer_project_path(@customer, @project))
  end

  private

  def find_project
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:project_id])
  end

end