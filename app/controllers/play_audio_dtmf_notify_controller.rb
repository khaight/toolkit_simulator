class PlayAudioDtmfNotifyController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', dtmf: true, notify_on_timeout: true, num_digits: 1, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/playaudiodtmf.mp3'] }
    when 'KeyPress'
      render json: { response_type: 'PlayAudio', notify_on_timeout: true, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/responseaudio.mp3'] }
    when 'Timeout'
      render json: { response_type: 'PlayAudio', dtmf: true, notify_on_timeout: true, num_digits: 1, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/playaudiodtmf.mp3'] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
