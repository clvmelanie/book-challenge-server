Rails.application.routes.draw do
  post 'register' => 'authentication#register'
  post 'auth_user' => 'authentication#authenticate_user'
  post 'books' => 'users#add_books'
  get 'books' => 'users#get_books'
end
