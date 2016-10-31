class UsersController < ApplicationController
  before_action :authenticate_request!

  def books_read
    @current_user.books_read = params[:books_read]
    if @current_user.save
      render json: {message: 'Books read successfully updated!'}
    else
      render json: {message: 'Books read not successfully updated!'}, status: :bad_request
    end
  end

  def books_list
    render json: {books_read: @current_user.books_read}
  end
end
