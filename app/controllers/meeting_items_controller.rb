class MeetingItemsController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :find_meeting
  skip_filter :find_meeting, :only => :index

  def index
    @items = MeetingItem.where :state_id => 1, :user_id => current_user.id
    respond_with(@items)
  end

  def show
    @item = @meeting.meeting_items.find(params[:id])
    respond_with(@item)
  end

  def new
    @item = @meeting.meeting_items.new
    respond_with(@item)
  end

  def edit
    @item = @meeting.meeting_items.find(params[:id])
  end

  def create
    @item = @meeting.meeting_items.new(params[:meeting_item])
    @item.save
    respond_with(@item, location: meeting_path(@meeting))
  end

  def update
    @item = @meeting.meeting_items.find(params[:id])
    @item.update_attributes(params[:meeting_item])
    respond_with(@item, location: meeting_path(@meeting))
  end

  def destroy
    @item = @meeting.meeting_items.find(params[:id])
    @item.destroy
    respond_with(@item, location: meeting_path(@meeting))
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end
end
