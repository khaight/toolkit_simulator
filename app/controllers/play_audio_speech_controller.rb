class PlayAudioSpeechController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', speech_hints: 'zoove, starstar, mobile', speech_timeout: 'auto', speech: true, timeout: 1, finish_on_key: '#', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/playaudiospeech.mp3'] }
    when 'Speech'
      render json: { response_type: 'PlayAudio', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/responseaudio.mp3'] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
