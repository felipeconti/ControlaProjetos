require "application_responder"

class ApplicationController < ActionController::Base

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery

  before_filter :authenticate_user!, :load_users

  private

  def load_users
    @users = User.all
  end

end
