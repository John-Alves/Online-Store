class ApplicationController < ActionController::Base
  layout "template"
  before_action :authenticate_user!

end
