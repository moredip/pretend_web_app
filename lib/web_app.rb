require 'sinatra'

class WebApp < Sinatra::Base
  get "/" do
    "Hello w!"
  end
end
