require 'rails_helper'

describe "/street_to_coords/new" do
  it "displays the street address", points: 0 do
    #====================  Begin setup  ===========================#
    # captures a URL pattern for the Google geocoding API call
    address_regex = /1600.*Pennsylvania.*Ave.*NW/i
    maps_url = /.*maps.googleapis.com\/maps\/api\/geocode\/json.address=#{Regexp.new(address_regex)}/
    # directs that URL pattern to a static hardcoded response that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, maps_url).to_return(body: File.new('spec/maps_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/street_to_coords/new"
    fill_in "Street Address", with: '1600 Pennsylvania Ave NW'
    click_button "Lookup Coordinates"
    expect(page).to have_content(/1600 Pennsylvania Ave NW/i)
  end

  it "displays the latitude", points: 1 do
    #====================  Begin setup  ===========================#
    # captures a URL pattern for the Google geocoding API call
    address_regex = /1600.*Pennsylvania.*Ave.*NW/i
    maps_url = /.*maps.googleapis.com\/maps\/api\/geocode\/json.address=#{Regexp.new(address_regex)}/
    # directs that URL pattern to a static hardcoded response that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, maps_url).to_return(body: File.new('spec/maps_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/street_to_coords/new"
    fill_in "Street Address", with: '1600 Pennsylvania Ave NW'
    click_button "Lookup Coordinates"
    expect(page).to have_content '38.89'
  end

  it "displays the longitude", points: 1 do
    #====================  Begin setup  ===========================#
    # captures a URL pattern for the Google geocoding API call
    address_regex = /1600.*Pennsylvania.*Ave.*NW/i
    maps_url = /.*maps.googleapis.com\/maps\/api\/geocode\/json.address=#{Regexp.new(address_regex)}/
    # directs that URL pattern to a static hardcoded response that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, maps_url).to_return(body: File.new('spec/maps_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/street_to_coords/new"
    fill_in "Street Address", with: '1600 Pennsylvania Ave NW'
    click_button "Lookup Coordinates"
    expect(page).to have_content '-77.03'
  end
end
