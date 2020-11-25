class BookCommentsController < ApplicationController

  def create
    @book_detail = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book_detail.id
    @book_comment.save
  end

  def destroy
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    book_detail = Book.find(params[:book_id])
    @book_comments = book_detail.book_comments.all
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
