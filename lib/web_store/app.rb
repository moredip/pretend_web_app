require "sinatra/base"
require "sinatra/reloader"

require "tilt/haml"

require 'web_store/deals_gateway'

module WebStore
class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    also_reload File.expand_path("../**/*.rb", __FILE__)
  end

  configure do
    set :views, File.expand_path( "../../../views", __FILE__ )
  end


  get "/" do
    deals = deals_gateway.deals

    view_model = { deals: deals }
    haml :index, locals: view_model
  end

  private

  def deals_gateway
    settings.deals_gateway
  end
end
end
