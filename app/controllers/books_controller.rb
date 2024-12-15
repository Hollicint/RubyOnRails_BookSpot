class BooksController < ApplicationController
  # actions show,edit,update,delete
  before_action :set_book, only: %i[ show edit update destroy ]
  # initializes the repository in one go without repeating throughout the page
  before_action :set_repository

  # GET /books or /books.json
  def index
    # Creating instance of repository
    # @book_repository = BookRepository.new

    # Uses repository to get books
    @books = @book_repository.all
    # @books = Book.all
  end

  # show 
  def show
  end

  # new 
  def new
    @book = Book.new
  end

  # edit 
  def edit
  end

  # create 
  def create
    # @book = Book.new(book_params)

    # new repository instance
    # @book_repository =BookRepository.new
    # create new book with repository
    @book = @book_repository.create(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  #  update 
  def update
    # new repository instance
    # @book_repository =BookRepository.new

    respond_to do |format|
      # if @book.update(book_params)
      # repository updates the book
      if @book_repository.update(@book, book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE 
  def destroy
    # @book.destroy!

    # new repository instance
    # @book_repository =BookRepository.new
    # delete book with repository
    @book_repository.delete(@book)

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully Deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      # @book = Book.find(params.expect(:id))
      # located book by id
      @book = Book.find(params[:id])
    end

    # initializes the repository at the before_action line at the top of the page
    def set_repository
      @book_repository = BookRepository.new
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title, :author, :genre, :book_description, :book_cost ])
    end
end
