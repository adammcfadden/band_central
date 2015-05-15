require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @bands = Band.all
  @venues = Venue.all
  erb :index
end

post '/venues' do
  @venue = Venue.new(name: params['venue_name'])
  if @venue.save()
    redirect to '/'
  else
    @selector = @venue
    erb :error
  end
end

post '/bands' do
  @band = Band.new(name: params['band_name'])
  if @band.save()
    redirect to '/'
  else
    @selector = @band
    erb :error
  end
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

delete '/bands/:id/delete' do
  band = Band.find(params['id'])
  if band.name == params['delete_band']
    band.delete
    redirect to '/'
  else
    redirect to "/bands/#{band.id}"
  end
end
