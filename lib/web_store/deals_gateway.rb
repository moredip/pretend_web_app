require 'faraday'
require 'faraday_middleware'
require 'microscope_tracer/faraday_middleware'

require 'web_store/deal'

module WebStore
  class DealsGateway
    def self.for_env(env=ENV)
      new(env.fetch('DEALS_SERVICE_BASE_URL'))
    end

    def initialize(base_url)
      @conn = Faraday.new(url:base_url) do |faraday|
        faraday.use MicroscopeTracer::FaradayMiddleware, $MICROSCOPE_SERVICE_NAME
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def deals
      # TODO: handle errors, etc
      response = @conn.get("/deals")
      response.body.map{ |deal_json| Deal.new(deal_json) }
    end
  end
end
