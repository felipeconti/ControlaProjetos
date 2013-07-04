class MeetingItemsController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :find_meeting
  skip_filter :find_meeting, :only => [:index, :result]

  def index
    if (params[:stateId].nil?)
      params[:stateId] = 1
    end
    @items = MeetingItem.where(:user_id => current_user.id, :state_id => params[:stateId]).order("meeting_id DESC, id")
    respond_with(@items)
  end

  def result
    if (params[:stateId].nil?)
      params[:stateId] = 1
    end
    @items = MeetingItem.where(:user_id => current_user.id, :state_id => params[:stateId]).order("meeting_id DESC, id")
    render :partial => 'meeting_items/grid'
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
