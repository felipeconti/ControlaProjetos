class ItemsController < ApplicationController
  respond_to :json
  respond_to :xml
  before_filter :find_task

  def index
    @items = @task.items.all
    respond_with(@items)
  end

  def show
    @item = @task.items.find(params[:id])
    respond_with(@item)
  end

  def new
    @item = @task.items.new
    respond_with(@item)
  end

  def edit
    @item = @task.items.find(params[:id])
  end

  def create
    @item = @task.items.new(params[:item])
    @item.save
    respond_with(@item, location: customer_project_task_path(@customer, @project, @item))
  end

  def update
    @item = @task.items.find(params[:id])
    @item.update_attributes(params[:item])
    respond_with(@item, location: customer_project_task_path(@customer, @project, @item))
  end

  def destroy
    @item = @task.items.find(params[:id])
    @item.destroy
    respond_with(@item, location: customer_project_task_path(@customer, @project, @item))
  end

  private

  def find_task
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
  end

end
