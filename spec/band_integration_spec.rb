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
end
