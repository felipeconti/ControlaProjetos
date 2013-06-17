class ItemsController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :find_task
  skip_filter :find_task, :only => :index

  def index
    if (params[:stateId].nil?)
      params[:stateId] = 1
    end
    @items = Item.where(:user_id => current_user.id, :state_id => params[:stateId])
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
