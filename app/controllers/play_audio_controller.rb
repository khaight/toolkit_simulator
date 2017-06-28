class PlayAudioController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      Rails.logger.debug(url_for('/audio/playaudioonly.m4a'))
      render json: { response_type: 'PlayAudio', audio_list: [url_for('/audio/playaudioonly.m4a')] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
