class ItemsController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :find_task
  skip_filter :find_task, :only => :index

  def index
    @items = Item.where(:state_id => 1, :user_id => current_user.id).order(:priority)
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
    @item.owner_id = current_user.id
    @item.save
    respond_with(@item, location: customer_project_task_path(@customer, @project, @task))
  end

  def update
    @item = @task.items.find(params[:id])
    @item.update_attributes(params[:item])
    respond_with(@item, location: customer_project_task_path(@customer, @project, @task))
  end

  def destroy
    @item = @task.items.find(params[:id])
    @item.destroy
    respond_with(@item, location: customer_project_task_path(@customer, @project, @task))
  end

  private

  def find_task
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:task_id])
  end

end
