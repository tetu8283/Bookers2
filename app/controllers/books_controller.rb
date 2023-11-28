class BooksController < ApplicationController
  # def new
  #   @book = Book.new
  # end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Create is successflly"
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      flash[:notice] = "Create error"
      render :index
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Update is successflly"
      redirect_to book_path(@book)  
    else
      flash[:notice] = "Update error"
      render :edit
    end
  end

  def index
    @books = Book.all
     # 新規投稿用の@book
    @book = Book.new
    @user = current_user
  end

  def show
    # paramsはparamsのみに省略できる
    @book = Book.find(params[:id])
    # @user = User.find(params[:id])
    @user = current_user
    @books = Book.all
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
