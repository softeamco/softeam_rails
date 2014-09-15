Rails.application.routes.draw do
  get "*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'
end
