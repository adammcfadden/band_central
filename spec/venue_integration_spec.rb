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
end
