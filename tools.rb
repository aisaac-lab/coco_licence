require 'net/http'

CHECKURI = "https://api.ipify.org?format=json"
PROXY_IP = 'fr.proxymesh.com'
PROXY_PORT = 31280
PROXY_ID = 'yaroramen'
PROXY_PW = 'yaroramen123'

###################
# p Net::HTTP.Proxy('157.7.220.63', 80).get(URI(CHECKURI))

# p Net::HTTP.Proxy('fr.proxymesh.com', 31280, 'yaroramen', 'yaroramen123').get(URI(CHECKURI))
###################

###################
require 'capybara/poltergeist'
# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(app, { js_errors: false, timeout: 60 })
# end
# session = Capybara::Session.new(:poltergeist)
#
# session.visit CHECKURI
# p session.html.tap { session.driver.quit }
###################

##################
# Capybara.register_driver :poltergeist_with_proxy do |app|
#   Capybara::Poltergeist::Driver.new(app, phantomjs_options: ["--proxy=12.13.14.15:4521"])
# end
# session = Capybara::Session.new(:poltergeist_with_proxy)
#
# session.visit CHECKURI
# p session.html.tap { session.driver.quit }
#################

##################
# Capybara.register_driver :poltergeist_with_proxy do |app|
#   Capybara::Poltergeist::Driver.new(app, phantomjs_options: ["--proxy=#{PROXY_IP}:#{PROXY_PORT}", "--proxy-auth=#{PROXY_ID}:#{PROXY_PW}"])
# end
# session = Capybara::Session.new(:poltergeist_with_proxy)
#
# session.visit CHECKURI
# p session.html.tap { session.driver.quit }
#################


Capybara.register_driver :selenium do |app|
  # http://code.google.com/p/chromedriver/downloads/list
  # sudo mv ~/Downloads/chromedriver /usr/bin/
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120
  Capybara::Selenium::Driver.new(app, http_client: client, browser: :chrome)
end
