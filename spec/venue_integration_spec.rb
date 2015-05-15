require 'spec_helper'

describe 'The venue path', type: :feature do
  before do
    visit '/'
    fill_in 'venue_name', with: 'the pavilion'
    click_on 'venue_name_button'
  end
  it 'will let the user add a venue' do
    expect(page).to have_content 'The Pavilion'
  end
  it 'will let the user visit the venue page' do
    click_on 'The Pavilion'
    expect(page).to_not have_content('Add a new Band')
    expect(page).to have_content('The Pavilion')
  end  
end
