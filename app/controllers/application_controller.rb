class ApplicationController < ActionController::Base
  include Navigation::ApplicationControllerHelpers
  navigation :top

  protect_from_forgery

  protected
  def current_user
    @current_user
  end

end
