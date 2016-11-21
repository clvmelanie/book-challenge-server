class UsersController < ApplicationController
  before_action :authenticate_request!

  def add_books
    @current_user.books_read = params[:books_read]
    if @current_user.save
      render json: {message: 'Books read successfully updated!'}
    else
      render json: {message: 'Books read not successfully updated!'}, status: :bad_request
    end
  end

  def get_books
    render json: {books_read: @current_user.books_read ? @current_user.books_read.present? : []}
  end
end
