require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/publisher.rb')
require_relative('../models/book.rb')

also_reload('../models/*')



get '/books' do
  @books = Book.all
  erb(:'books/index')
end


get '/books/new' do
  @books = Book.all
  erb(:'books/new')
end


get '/books/:id' do
  @book = Book.find(params['id'].to_i)
  erb(:'books/show')
end
