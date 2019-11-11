require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/publisher.rb')
require_relative('../models/book.rb')

also_reload('../models/*')



get '/books' do
  @books = Book.all
  erb(':books/index')
end 
