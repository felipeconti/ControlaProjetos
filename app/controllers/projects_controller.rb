class ProjectsController < ApplicationController
  respond_to :json
  respond_to :xml
  before_filter :find_customer

  def index
    @projects = @customer.project.all
    respond_with(@projects)
  end

  def show
    @project = @customer.projects.find(params[:id])
    respond_with(@project)
  end

  def new
    @project = @customer.projects.new
    respond_with(@project)
  end

  def edit
    @project = @customer.projects.find(params[:id])
  end

  def create
    @project = @customer.projects.new(params[:project])
    @project.save
    respond_with(@project, location: customer_path(@customer))
  end

  def update
    @project = @customer.projects.find(params[:id])
    @project.update_attributes(params[:project])
    respond_with(@project, location: customer_path(@customer))
  end

  def destroy
    @project = @customer.projects.find(params[:id])
    @project.destroy
    respond_with(@project, location: customer_path(@customer))
  end

  private

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end

end
