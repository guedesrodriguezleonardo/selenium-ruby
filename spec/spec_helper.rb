# frozen_string_literal: true

require 'allure-rspec'
require 'rspec'
require 'pry'

AllureRspec.configure do |c|
  c.results_directory = 'allure-results'
  c.clean_results_directory = true
end