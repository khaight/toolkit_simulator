Rails.application.routes.draw do
  resources :call_forward, only: %i[create]
  resources :play_audio, only: %i[create]
end
