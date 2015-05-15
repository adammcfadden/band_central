require 'spec_helper'

describe 'The band path', type: :feature do
  before do
    visit '/'
    fill_in 'band_name', with: 'the doors'
    click_on 'band_name_button'
  end
  it 'will let the user add a band' do
    expect(page).to have_content 'The Doors'
  end
  it 'will let the user visit the band page' do
    click_on 'The Doors'
    expect(page).to_not have_content 'Add a new Venue'
    expect(page).to have_content 'The Doors'
  end
  it 'will let the user add venues to the band' do
    venue = Venue.create(name: 'the porch')
    click_on 'The Doors'
    check venue.id
    click_on 'venue_check_button'
    click_on 'The Porch'
    expect(page).to_not have_content 'Change the Band Name'
    expect(page).to have_content 'The Porch'
  end
  it 'will let the user change the band name' do
    click_on 'The Doors'
    fill_in 'new_band_name', with: 'the colberts'
    click_on 'new_band_name_button'
    expect(page).to have_content 'The Colberts'
  end
end
