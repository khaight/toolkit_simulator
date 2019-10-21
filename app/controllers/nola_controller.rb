class NolaController < ActionController::API
  def create
    case params[:request_type]
    when 'CallStart'
      render json: { response_type: 'PlayAudio', gather_after: 'false', dtmf: 'true', num_digits: 1, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/nola/main.wav'] }
      Thread.new do
        sms(params[:mdn]
      end
    when 'KeyPress'
      if params[:key_pressed].to_i == 1
        render json: { response_type: 'PlayAudio', dtmf: 'false', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/nola/song.wav'] }
      elsif params[:key_pressed].to_i == 2
        render json: { response_type: 'PlayAudio', dtmf: 'false', audio_list: ['https://toolkit-simulator.herokuapp.com/audio/nola/legal.wav'] }
      else
        render json: { response_type: 'PlayAudio', gather_after: 'false', dtmf: 'true', num_digits: 1, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/nola/main.wav'] }
      end
    when 'Termination'
    when 'NoInput'
      render json: { response_type: 'PlayAudio', gather_after: 'false', dtmf: 'true', num_digits: 1, audio_list: ['https://toolkit-simulator.herokuapp.com/audio/nola/main.wav'] }
    else
      Rails.logger.error('unable to get request type')
    end
  end

  private

  def sms(mdn)
    payload = { number: '**NOLA', type: 'sms', mdn: mdn.sub!(/^1*/, ''), msgtext: "Thank you for your call. I hope you love my new EP, Medicine.\nStream it here:\nSPOTIFY: http://bit.ly/nolaspotify\nAPPLE MUSIC: http://bit.ly/nolaapplemusic\nSoundcloud: http://bit.ly/nolasoundcloud" }

    resp = RestClient::Request.execute(method: :post, url: 'https://api.starstarmobile.com/shortdial/v1/16534f8049900135f7dc009c029b1b40/messages', payload: payload.to_json, headers: api_headers, timeout: 5)
    Rails.logger.info('Message Response' + resp.inspect)
  rescue StandardError => e
    Rails.logger.info(resp.http_body.inspect) unless resp.nil?
    Rails.logger.info(e.inspect)
  end

  def api_headers
    headers = {}
    headers['Content-Type'] = 'application/json'
    headers['Accept'] = 'application/json'
    headers['master-account-id'] = '243e2d25037175ab22b099920773bf94'
    headers
  end
end
