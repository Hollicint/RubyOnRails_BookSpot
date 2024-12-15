# class ApplicationController < ActionController::Base
#  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
#  allow_browser versions: :modern
# end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # ** to readd the login remove the comment below #
  # before_action :authenticate_user!
end
