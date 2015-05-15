require 'spec_helper'

describe Venue do
  describe 'Band to Venue relation' do
    it 'will recall a venue that is associated with a Band' do
      venue = Venue.create(name: 'the lC')
      band = Band.create(name: 'the beatles')
      venue.update(band_ids: [band.id])
      expect(venue.bands.to_a).to(eq([band]))
    end
    it 'will return the venue name in titlecase' do
      venue = Venue.create(name: 'the lC')
      expect(venue.name).to(eq('The Lc'))
    end
  end
end
