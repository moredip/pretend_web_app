require "sinatra/base"
require "sinatra/reloader"

require "tilt/haml"

module WebStore
class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :views, File.expand_path( "../../../views", __FILE__ )

  get "/" do
    haml :index
  end
end
end
