require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return "hello!"
  end

  get '/hello' do
    name = params[:name]
    return "Hello #{name}"
  end

  get '/posts' do
    name = params[:name]
    cohort_name = params[:cohort_name]
    return "Hello #{name}, you are in #{cohort_name}"
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]
    return "Thanks #{name}, you sent this message: #{message}"
  end
end