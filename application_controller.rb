require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/getgif' do
     search=params[:search]
    @result=format_request_and_call_api(search)
    #@result=["http://...","ajiof;awwi0923"]
    @title=@result[1]
    @url=@result[0]
    erb :results
    
  end
  
end