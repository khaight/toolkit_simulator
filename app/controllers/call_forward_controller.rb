class CallForward < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'Forward', forward_to: '12124797990' }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
