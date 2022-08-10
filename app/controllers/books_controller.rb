class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was succesfully created"
      redirect_to book_path(@book.id)
    else
      flash[:alret] ="can't be blank"
      @books = Book.all
      render :index
    end  
  end

    # @book = Book.new(book_params)
    # if @book.save

    # book.save
    # redirect_to book_path(book.id)
    # end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    # if @book.save
    #   flash[:success] = "Succesfully"
    #   redirect_to book_path(@book.id)
    # else
    #   @books = Book.all
    #   flash.now[:danger] ="Try again"
    #   render :index
    # end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was succesfully created"
      redirect_to book_path(@book.id)
    else
      # flash[:alret] 
      @books = Book.all
      render :edit
    end  
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
