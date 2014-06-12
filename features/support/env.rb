require 'uri'
require 'net/http'

require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'cucumber'

World(PageObject::PageFactory)

Before do
  @browser = Selenium::WebDriver.for :firefox
end

After do
  @browser.close
end