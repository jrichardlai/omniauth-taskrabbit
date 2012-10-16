# Sample app for TaskRabbit OAuth2 Strategy
# Make sure to setup the ENV variables TR_API_KEY and TR_SECRET
# Run with "bundle exec rackup"
ENV['TR_API_KEY']         = 'ior8jfh723hfD8fj9eSi383Niojreiu3U832hf90'
ENV['TR_API_SECRET']      = 'pfjf7dfw392h2D2iofkjpxqdreLKue523tdnbdff'
ENV['RACK_COOKIE_SECRET'] = 'secret'
ENV['API_SITE']           = 'https://taskrabbitdev.com'

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'omniauth'
require 'omniauth-taskrabbit'
require 'openssl'
require 'debugger'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class App < Sinatra::Base
  get '/' do
    <<-HTML
    <ul>
      <li><a href='/auth/taskrabbit'>Sign in with TaskRabbit</a></li>
    </ul>
    HTML
  end

  get '/auth/:provider/callback' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  end
  
  get '/auth/failure' do
    content_type 'text/plain'
    request.env['omniauth.auth'].to_hash.inspect rescue "No Data"
  end
end

use Rack::Session::Cookie, :secret => ENV['RACK_COOKIE_SECRET']

use OmniAuth::Builder do
  provider :taskrabbit, ENV['TR_API_KEY'], ENV['TR_API_SECRET'], {:client_options => {:site => ENV['API_SITE']}}
end

run App.new