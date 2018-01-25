require 'rails_helper'

describe "/coords_to_weather/new" do
  it "displays the latitude", points: 0 do
    #====================  Begin setup  ===========================#
    # captures two potential URL patterns from the controller forceast API calls
    old_forecasts_url = /.*api.forecast.io\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    new_forecasts_url = /.*api.darksky.net\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    # directs those URL patterns to static hardcoded responses that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, old_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    stub_request(:any, new_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/coords_to_weather/new"
    fill_in "Latitude", with: '38.8977332'
    fill_in "Longitude", with: '-77.0365305'
    click_button "Lookup Weather"
    expect(page).to have_content '38.8977332'
  end

  it "displays the longitude", points: 0 do
    #====================  Begin setup  ===========================#
    # captures two potential URL patterns from the controller forceast API calls
    old_forecasts_url = /.*api.forecast.io\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    new_forecasts_url = /.*api.darksky.net\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    # directs those URL patterns to static hardcoded responses that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, old_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    stub_request(:any, new_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/coords_to_weather/new"
    fill_in "Latitude", with: '38.8977332'
    fill_in "Longitude", with: '-77.0365305'
    click_button "Lookup Weather"
    expect(page).to have_content '-77.0365305'
  end

  it "displays the current temperature", points: 1 do
    #====================  Begin setup  ===========================#
    # captures two potential URL patterns from the controller forceast API calls
    old_forecasts_url = /.*api.forecast.io\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    new_forecasts_url = /.*api.darksky.net\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    # directs those URL patterns to static hardcoded responses that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, old_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    stub_request(:any, new_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/coords_to_weather/new"
    fill_in "Latitude", with: '38.8977332'
    fill_in "Longitude", with: '-77.0365305'
    click_button "Lookup Weather"
    temp = '46'
    expect(page).to have_content(temp)
  end

  it "displays the current summary", points: 1 do
    #====================  Begin setup  ===========================#
    # captures two potential URL patterns from the controller forceast API calls
    old_forecasts_url = /.*api.forecast.io\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    new_forecasts_url = /.*api.darksky.net\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    # directs those URL patterns to static hardcoded responses that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, old_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    stub_request(:any, new_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/coords_to_weather/new"
    fill_in "Latitude", with: '38.8977332'
    fill_in "Longitude", with: '-77.0365305'
    click_button "Lookup Weather"
    outlook = 'Partly Cloudy'
    expect(page).to have_content(/#{outlook}/i)
  end

  it "displays the outlook for the next sixty minutes", points: 1 do
    #====================  Begin setup  ===========================#
    # captures two potential URL patterns from the controller forceast API calls
    old_forecasts_url = /.*api.forecast.io\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    new_forecasts_url = /.*api.darksky.net\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    # directs those URL patterns to static hardcoded responses that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, old_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    stub_request(:any, new_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/coords_to_weather/new"
    fill_in "Latitude", with: '38.8977332'
    fill_in "Longitude", with: '-77.0365305'
    click_button "Lookup Weather"
    outlook = 'Partly cloudy for the hour'
    expect(page).to have_content(/#{outlook}/i)
  end

  it "displays the outlook for the next several hours", points: 1 do
    #====================  Begin setup  ===========================#
    # captures two potential URL patterns from the controller forceast API calls
    old_forecasts_url = /.*api.forecast.io\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    new_forecasts_url = /.*api.darksky.net\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    # directs those URL patterns to static hardcoded responses that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, old_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    stub_request(:any, new_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/coords_to_weather/new"
    fill_in "Latitude", with: '38.8977332'
    fill_in "Longitude", with: '-77.0365305'
    click_button "Lookup Weather"
    outlook = 'Mixed precipitation starting tomorrow morning, continuing until tomorrow afternoon'
    expect(page).to have_content(/#{outlook}/i)
  end

  it "displays the outlook for the next several days", points: 1 do
    #====================  Begin setup  ===========================#
    # captures two potential URL patterns from the controller forceast API calls
    old_forecasts_url = /.*api.forecast.io\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    new_forecasts_url = /.*api.darksky.net\/forecast\/.*\/#{Regexp.new('38.8977332')},#{Regexp.new('-77.0365305')}/
    # directs those URL patterns to static hardcoded responses that we've pre-
    # saved, instead of waiting for a dynamic web response
    stub_request(:any, old_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    stub_request(:any, new_forecasts_url).to_return(body: File.new('spec/forecasts_response_body.txt'), status: 200)
    #====================  End setup  =============================#

    visit "/coords_to_weather/new"
    fill_in "Latitude", with: '38.8977332'
    fill_in "Longitude", with: '-77.0365305'
    click_button "Lookup Weather"
    outlook = 'Light rain tomorrow through Saturday, with temperatures peaking at 69°F on Thursday'
    expect(page).to have_content(/#{outlook}/i)
  end
end
