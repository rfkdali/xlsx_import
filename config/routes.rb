Rails.application.routes.draw do
  root 'imports#index'
  resources 'imports'
  resources 'contacts', only: [:index]
end
