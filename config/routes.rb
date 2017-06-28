Rails.application.routes.draw do
  resources :call_forward, only: %i[create]
end
