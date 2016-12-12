Rails.application.routes.draw do
  root 'imports#index'
  resources 'imports'
  resources 'contacts', only: [:index]
  resources 'list_contacts', only: [:index]
end
