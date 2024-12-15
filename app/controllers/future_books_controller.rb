class FutureBooksController < ApplicationController
    def index
        #get all books
        @future_books = FutureBook.all 
        # creates instance for the form
        @future_book = FutureBook.new 
    end
    
    # creates  post for future book to be added
    def create
        #instance of new book with parameters
        @future_book = FutureBook.new(future_book_params)

        #if statement to check book and display when saved
        if @future_book.save
            @future_books = FutureBook.all 
            render :index
        else
            @future_books = FutureBook.all 
            render :index      
        end    
    end    

    private
        # Only allow a list of trusted parameters through.

        def future_book_params
            params.require(:future_book).permit(:title, :author, :status, :note)
        end    
    

end
