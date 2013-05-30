class MeetingsController < InheritedResources::Base
  respond_to :html, :xml, :json

  def index
    @meetings = Meeting.all
    respond_with(@meetings)
  end

  def show
    @meeting = Meeting.find(params[:id])
    respond_with(@meeting)
  end

  def new
    @meeting = Meeting.new
    respond_with(@meeting)
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new(params[:meeting])
    @meeting.save
    respond_with(@meeting)
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update_attributes(params[:meeting])
    respond_with(@meeting)
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    respond_with(@meeting)
  end
end