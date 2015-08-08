$LOAD_PATH.unshift File.expand_path( "../lib", __FILE__ )

require 'web_app'
#require 'microscope_tracer/rack_middleware'

if ENV['RACK_ENV'].downcase == 'development'
  $stdout.sync = true
  puts "running in DEV MODE!"
end

#use MicroscopeTracer::RackMiddleware, 'deals-service'
run WebApp
