class TransferController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'Transfer', forward_to: '14155150440' }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
