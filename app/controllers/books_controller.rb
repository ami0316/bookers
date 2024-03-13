class BooksController < ApplicationController
  
 #以下を追加
  def create
  # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 4. フラッシュメッセージを定義し、トップ画面へリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
     @books = Book.all
     render :index#この記述を追加
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
   # １.&2. データを受け取り新規登録するためのインスタンス作成
    
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.update(book_params)
      
    # 4. フラッシュメッセージを定義
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id) 
    else
      @books = Book.all
      render :edit#この記述を追加
    end
  end
  
  

  


private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
