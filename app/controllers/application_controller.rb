class ApplicationController < ActionController::Base
  protect_from_forgery  
  # Default: all helpers included in views; must be explicit in controllers
  include SessionsHelper
end
