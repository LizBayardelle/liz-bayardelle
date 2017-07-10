Rails.application.routes.draw do
  resources :home, only: [:index]
  root "home#index"

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]
  post "user/:id/archive" => "users#archive_client", as: "archive_client"
  post "user/:id/unarchive" => "users#unarchive_client", as: "unarchive_client"
  post "user/:id/confirm" => "users#confirm_client", as: "confirm_client"
  post "user/:id/unconfirm" => "users#unconfirm_client", as: "unconfirm_client"

  resources :inquiries
  resources :blogs do
    resources :comments
  end
  get 'tags/:tag', to: 'blogs#index', as: :tag
  get 'services/hire'
  get 'services/dev'
  get 'services/design'
  get 'services/branding'
  get 'services/portfolio'

  resources :contacts
  post "contact/:id/archive" => "contacts#archive_contact", as: "archive_contact"
  post "contact/:id/unarchive" => "contacts#unarchive_contact", as: "unarchive_contact"

  post "users/:id/subscribe_to_blog" => "users#subscribe_to_blog", as: "subscribe_to_blog"
  post "comment/:id/approve" => "comments#approve_comment", as: "approve_comment"
  post "comment/:id/unapprove" => "comments#unapprove_comment", as: "unapprove_comment"

end
