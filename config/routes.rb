Rails.application.routes.draw do
  root 'landing#index'
  resources 'checkers', only: [:index, :show]
  resources 'articles', only: [:new, :create]
  post 'api/query', to: 'api#query'
end
