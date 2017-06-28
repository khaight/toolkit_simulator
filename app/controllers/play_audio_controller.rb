class PlayAudioController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', audio_list: ['https://toolkit-simulator.herokuapp.com/playaudioonly.m4a'] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
