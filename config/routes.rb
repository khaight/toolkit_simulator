Rails.application.routes.draw do
  resources :call_forward, only: %i[create]
  resources :play_audio, only: %i[create]
  resources :play_audio_dtmf, only: %i[create]
end
