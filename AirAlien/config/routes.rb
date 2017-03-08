Rails.application.routes.draw do
  
  root 'pages#home'

  devise_for :users, 
  			 :path => '', 
  			 :path_names => {:sign_up => 'login', :sign_out => 'logout', :edit => 'profile'},
  			 :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}

  
end
