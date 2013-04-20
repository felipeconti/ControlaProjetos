class UsersJsonController < ApplicationController
  respond_to :html
  respond_to :json
  def index
    @users = User.all
    respond_with(@users)
  end
end
