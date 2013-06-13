class UsersJsonController < ApplicationController
  respond_to :json

  skip_before_filter :authenticate_user!, :only => "index"

  def index
    @users = User.all
    respond_with(@users)
  end

end
