require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/publisher.rb')
require_relative('../models/book.rb')

also_reload('../models/*')


get '/publishers' do
  @publishers = Publisher.all
  erb(:'publishers/index')
end


get '/publishers/new' do
  @publishers = Publisher.all
  erb(:'publishers/new')
end

post '/publishers' do # create
  @publisher = Publisher.new(params)
  @publisher.save()
  erb(:'publisher/create')
end

get '/publisher/:id' do
  @publisher = Publisher.find(params['id'].to_i)
  erb(:'publisher/show')
end


post '/publisher/:id' do # update
  Publisher.new(params).update
  redirect to '/publisher'
end

post '/publisher/:id/delete' do # delete
  publisher = Publisher.find(params[:id])
  publisher.delete()
  redirect to '/publisher'
end



get '/publishers/:id' do
  @publisher = Publisher.find(params['id'].to_i)
  erb(:'publishers/show')
end
