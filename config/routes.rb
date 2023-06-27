Rails.application.routes.draw do
  root 'main#index', as: 'home'
  get 'main/index'
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'report_by_dates', to: 'reports#report_by_dates', as: 'report_by_dates'
  get 'report_by_category', to: 'reports#report_by_category', as: 'report_by_category'
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
