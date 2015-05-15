require 'spec_helper'

describe Band do
  it 'ensures that no band can have a name over 50 characters' do
    band = Band.new(name: 'x' * 51)
    expect(band.save()).to(eq(false))
  end
  describe 'Venue to Band relation' do
    it 'will recall a venue that is associated with a Band' do
      band = Band.create(name: 'the beatles')
      venue = Venue.create(name: 'the LC')
      band.update(venue_ids: [venue.id])
      expect(band.venues.to_a).to(eq([venue]))
    end
    it 'will return the band name in titlecase' do
      band = Band.create(name: 'the beatles')
      expect(band.name).to(eq('The Beatles'))
    end
  end
end
