Rails.application.routes.draw do
 
#  This is for heroku to not break
  root 'welcome#index'


# this is the create token route - not sure if I need to move it

post 'user_token' => 
'user_token#create'
  # this has meals nested within users so all meals will be created and associated to a user
  resources :users do
    resources :meals
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
