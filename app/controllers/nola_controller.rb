class NolaController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', gather_after: 'false', dtmf: 'true', num_digits: 1, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/nola.m4a'] }
    when 'KeyPress'
      render json: { response_type: 'PlayAudio', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/nola.m4a'] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
