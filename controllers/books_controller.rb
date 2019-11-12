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
  erb(:'books/new')
end

post '/books' do # create
  @book = Book.new( params )
  @book.save()
  erb(:'books/create')
end

get '/books/:id' do
  @book = Book.find(params['id'].to_i)
  erb(:'books/show')
end


post '/books/:id' do # update
  Book.new(params).update
  redirect to '/books'
end

post '/books/:id/delete' do # delete
  book = Book.find(params[:id])
  book.delete()
  redirect to '/books'
end
