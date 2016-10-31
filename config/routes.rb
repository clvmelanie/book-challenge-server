Rails.application.routes.draw do
  post 'register' => 'authentication#register'
  post 'auth_user' => 'authentication#authenticate_user'
  post 'books_read' => 'users#books_read'
  get 'books_list' => 'users#books_list'
end
