class StatesController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @states = State.all
    respond_with(@states)
  end

  def show
    @state = State.find(params[:id])
    respond_with(@state)
  end

  def new
    @state = State.new
    respond_with(@state)
  end

  def edit
    @state = State.find(params[:id])
  end

  def create
    @state = State.new(params[:state])
    @state.save
    respond_with(@State)
  end

  def update
    @state = State.find(params[:id])
    @state.update_attributes(params[:state])
    respond_with(@state)
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    respond_with(@state)
  end
end
