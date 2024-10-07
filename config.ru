# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
use Rack::ReverseProxy do
  reverse_proxy /^\/blog(\/.*)$/, 'https://blog.rightapp4u.com$1', :timeout => 500, :preserve_host => true
end
run Rails.application
