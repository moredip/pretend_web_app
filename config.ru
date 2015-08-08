$LOAD_PATH.unshift File.expand_path( "../lib", __FILE__ )

require 'request_store'

require 'web_store/app'
require 'microscope_tracer/rack_middleware'

if ENV['RACK_ENV'].downcase == 'development'
  $stdout.sync = true
  puts "running in DEV MODE!"
end

use MicroscopeTracer::RackMiddleware, 'web-store'
run WebStore::App
