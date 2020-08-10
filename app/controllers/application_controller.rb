class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render :not_found, status: :not_found
  end
end
