require 'rails_helper'

RSpec.feature 'main page', :js do
  scenario "visit" do
    visit root_path
    expect(page.status_code).to eq(200).or eq(304)
  end
end
