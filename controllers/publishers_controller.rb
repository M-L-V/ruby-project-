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
  erb(:'publishers/create')
end

get '/publisher/:id' do
  @publisher = Publisher.find(params['id'].to_i)
  erb(:'publishers/show')
end


post '/publishers/:id' do # update
  Publisher.new(params).update
  redirect to '/publishers'
end

post '/publishers/:id/delete' do # delete
  publisher = Publisher.find(params[:id])
  publisher.delete()
  redirect to '/publishers'
end


get '/publishers/:id' do
  @publisher = Publisher.find(params['id'].to_i)
  erb(:'publishers/show')
end
