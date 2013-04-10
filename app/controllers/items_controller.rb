class ItemsController < ApplicationController
  respond_to :json
  respond_to :xml
  before_filter :find_task

  def index
    @items = @task.task.all
    respond_with(@items)
  end

  def show
    @task = @task.items.find(params[:id])
    respond_with(@task)
  end

  def new
    @task = @task.items.new
    respond_with(@task)
  end

  def edit
    @task = @task.items.find(params[:id])
  end

  def create
    @task = @task.items.new(params[:task])
    @task.save
    respond_with(@task, location: customer_project_task_path(@task))
  end

  def update
    @task = @task.items.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with(@task, location: customer_project_task_path(@task))
  end

  def destroy
    @task = @task.items.find(params[:id])
    @task.destroy
    respond_with(@task, location: customer_project_task_path(@task))
  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

end
