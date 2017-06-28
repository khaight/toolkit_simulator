class ApplicationController < ActionController::API
  before_action :log_request

  protected

  def log_request
    Rails.logger.info(params.inspect)
  end
end
