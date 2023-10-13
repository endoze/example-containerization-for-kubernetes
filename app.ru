# frozen_string_literal: true

require "bundler/inline"

# Set up our dependencies on rack and puma
# Rack is a web server interface
# Puma is a rack compliant web server
gemfile(true) do
  source "https://rubygems.org"

  gem "rack", "2.2.4"
  gem "puma", "5.6.5"
end

# We don't have to define a class in order for this app to
# work with rack. We could have just defined a proc that 
# accepts 1 argument and returns the same array of data.
class Application
  def call(env)
    ['200', {'Content-Type' => 'text/html'}, ["Hello World"]]
  end
end

# Run our application via puma
run Application.new
