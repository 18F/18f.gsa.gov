require 'chromedriver/helper'
require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path=Gem.bin_path("chromedriver-helper","chromedriver-helper")
