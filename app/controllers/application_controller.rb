class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  include SessionsHelper
  
  private
    def record_not_found
      render file: "/public/404.html", layout: false, status: :not_found
    end
end
