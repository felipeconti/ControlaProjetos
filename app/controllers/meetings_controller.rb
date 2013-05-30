class MeetingsController < InheritedResources::Base
  actions :index, :show, :new, :create
end