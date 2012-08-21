PTE::Application.routes.draw do
  
  root :to => 'Pages#landing'
  match '/home', :to => 'Pages#home'
  match '/about', :to => 'Pages#about'
  match '/contact', :to => 'Pages#contact'
  match '/admin', :to => 'Pages#admin'
  match '/admin/artists', :to => 'Pages#adminartists'
  match '/admin/events', :to => 'Pages#adminevents'
  devise_for :admins
  resources :artists do
    resources :pieces
    resources :biography
  end
  resources :events

end
