json.extract! book, :id, :title, :author, :genre, :book_description, :book_cost, :created_at, :updated_at
json.url book_url(book, format: :json)
