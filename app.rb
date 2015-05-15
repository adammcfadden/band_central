require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @bands = Band.all
  @venues = Venue.all
  erb :index
end

post '/venues' do
  Venue.create(name: params['venue_name'])
  redirect to '/'
end

post '/bands' do
  Band.create(name: params['band_name'])
  redirect to '/'
end
