Rails.application.routes.draw do
  resources :callforward, only: %i[create]
end
