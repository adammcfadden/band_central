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

get '/bands/:id' do
  @band = Band.find(params['id'])
  @venues = Venue.all
  erb :band
end

get '/venues/:id' do
  @venue = Venue.find(params['id'])
  @bands = Band.all
  erb :venue
end

patch '/bands/:id' do
  band = Band.find(params['id'])
  if params['venue_checks'] != nil
    venues = Venue.find(params['venue_checks'])
    venues.each do |venue|
      band.venues.push(venue)
    end
  end
  redirect to "/bands/#{band.id}"
end

patch '/bands/:id/rename' do
  band = Band.find(params['id'])
  band.update(name: params['new_band_name'])
  redirect to "/bands/#{band.id}"
end
