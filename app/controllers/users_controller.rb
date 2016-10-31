class UsersController < ApplicationController
  before_action :authenticate_request!

  def add_books
    @current_user.books_read = params[:books_read]
    @current_user.books_read.map! do |br|
      br.to_unsafe_h
    end
    @current_user.books_read = @current_user.books_read.to_json
    if @current_user.save
      render json: {message: 'Books read successfully updated!'}
    else
      render json: {message: 'Books read not successfully updated!'}, status: :bad_request
    end
  end

  def get_books
    books_read = @current_user.books_read.present? ? JSON.parse(@current_user.books_read) : []
    render json: {books_read: books_read}
  end
end
