# frozen_string_literal: true

require_relative '../lib/GoogleSearchPage'
require 'selenium-webdriver'
require 'webdrivers'

describe "GoogleSearch for Pizza" do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @googleSearchPage = GoogleSearchPage.new(@driver)
  end

  after(:each) do
    @driver.quit
  end

  it "should display search results for pizza" do
    @googleSearchPage.visit
    @googleSearchPage.search("pizza")

    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { @googleSearchPage.searchResults.any? }
    searchResults = @googleSearchPage.searchResults.map(&:text)
    
    expect(searchResults.any? { |result| result.downcase.include?("pizza") }).to eq(true)
  end
end
