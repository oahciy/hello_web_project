require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/submit' do
    name = params[:name]
    age = params[:age]
    return "#{name}: #{age}"
  end

  get '/names' do
    name = params[:name]
    return "#{name}"
  end

  post '/sort_names' do
    names = params[:names]
    sorted_names = names.split(",").sort.join(",")
    return "#{sorted_names}"
  end
end