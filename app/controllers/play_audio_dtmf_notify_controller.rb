class PlayAudioDtmfNotifyController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', dtmf: true, notify_no_input: true, num_digits: 1, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/playaudiodtmf.mp3'] }
    when 'KeyPress'
      render json: { response_type: 'PlayAudio', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/responseaudio.mp3'] }
    when 'NoInput'
      render json: { response_type: 'PlayAudio', notify_no_input: true, speech_hints: 'zoove, starstar, mobile', speech: true, timeout: 1, finish_on_key: '#', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/playaudiospeech.mp3'] }
    when 'Termination'
    else
      Rails.logger.error('unable to get request type')
    end
  end
end
