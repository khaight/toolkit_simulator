Rails.application.routes.draw do
  resources :call_forward, only: %i[create]
  resources :play_audio, only: %i[create]
  resources :play_audio_dtmf, only: %i[create]
  resources :play_audio_speech, only: %i[create]
  resources :play_audio_dtmf_notify, only: %i[create]
end
