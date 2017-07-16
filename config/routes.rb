Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  

  resources :users
  devise_scope :user do
    get '/sign_up', to: 'registrations#new'
    post '/sign_up', to: 'registrations#create', as: :signup
  end
  resources :tickets
  scope '/tickets' do
    get '/export/pdf', to: 'tickets#export'
  end
end
