Rails.application.routes.draw do
  devise_for :users
    root to: 'pages#home'
   get 'widget', to: 'widgets#widget'
   get 'widget_2', to: 'widgets#widget_2'
   get 'test_widget', to: 'widgets#test_widget'

   resources :leads , only: [:index, :show, :new, :destroy, :create ]
   #
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
