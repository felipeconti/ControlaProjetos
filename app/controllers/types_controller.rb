class TypesController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @types = Type.all
    respond_with(@types)
  end

  def show
    @type = Type.find(params[:id])
    respond_with(@type)
  end

  def new
    @type = Type.new
    respond_with(@type)
  end

  def edit
    @type = Type.find(params[:id])
  end

  def create
    @type = Type.new(params[:type])
    @type.save
    respond_with(@type)
  end

  def update
    @type = Type.find(params[:id])
    @type.update_attributes(params[:type])
    respond_with(@type)
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    respond_with(@type)
  end
end