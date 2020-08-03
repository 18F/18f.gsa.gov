require_relative "../lib/rack/jekyll"

# Middleware
use Rack::ShowExceptions  # Nice looking errors

run Rack::Jekyll.new
