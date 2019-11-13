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
  @publishers = Publisher.all()
  erb(:'books/new')
end

post '/books' do # create
  @book = Book.new( params )
  @book.save()
  erb(:'books/create')
end

get '/books/:id' do
  @book = Book.find(params['id'].to_i)
  @publishers = Publisher.all()
  erb(:'books/show')
end


get '/books/:id/edit' do # edit
  @book = Book.find(params[:id])
  @publishers = Publisher.all()
  erb(:'books/edit')
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
