Rails.application.routes.draw do
  root 'contacts#index'
  resources 'imports', only: [:create]
  resources 'contacts', only: [:index]
end
