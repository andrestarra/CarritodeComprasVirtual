Rails.application.routes.draw do
  devise_for :usuarios
  get 'sesiones/new'
  get 'sesiones/create'
  get 'sesiones/login'
  get 'sesiones/welcome'
  get 'usuarios/new'
  get 'usuarios/create'
  resources :inicio, only: [:index, :show]
  get 'carritos/show'
  resources :articulos
  resources :articulos_pedidos
  resource :carritos, only: [:show]

  root "inicio#index"
end
