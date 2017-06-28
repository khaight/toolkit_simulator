class PlayAudioSpeechController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', speech: true, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/playaudiospeech.mp3'] }
    when 'KeyPress'
      render json: { response_type: 'PlayAudio', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/responseaudio.mp3'] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
