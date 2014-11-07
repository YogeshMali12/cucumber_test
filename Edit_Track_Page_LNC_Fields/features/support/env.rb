require 'rspec'
require 'page-object'
require 'require_all'
require 'net/http'
require 'yaml'
require 'nokogiri'
require 'open-uri'
require 'spreadsheet'
require 'awesome_print'
require 'byebug'



World(PageObject::PageFactory)



RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.error_messages.include? message
  end
end

