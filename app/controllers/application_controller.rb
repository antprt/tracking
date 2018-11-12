#This class is the parent for actions in browser
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
