class PlayAudioSpeechController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', gather_after: 'false', speech_hints: 'one, zoove, starstar, mobile', speech_timeout: 'auto', speech: 'true', timeout: 10, finish_on_key: '#', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/playaudiospeech.mp3'] }
    when 'Speech'
      render json: { response_type: 'PlayAudio', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/responseaudio.mp3'] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
