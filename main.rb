require 'bundler/setup'
Bundler.require(:default)
LIB_NAMES =  ["Alamofire", "AWSCore", "AWSS3", "AWSCore", "Bolts", "Bolts/AppLinks", "Bolts/Tasks", "Bolts/AppLinks", "Bolts/Tasks", "Bolts/Tasks", "Crashlytics", "Fabric", "DZNEmptyDataSet", "Fabric", "FBSDKCoreKit", "Bolts", "FBSDKLoginKit", "FBSDKCoreKit", "FBSDKShareKit", "JEToolkit", "JEToolkit/JEDebugging", "JEToolkit/JEOrderedDictionary", "JEToolkit/JESettings", "JEToolkit/JEToolkit", "JEToolkit/JEWeakCache", "JEToolkit/JEDebugging", "JEToolkit/JEToolkit", "JEToolkit/JEOrderedDictionary", "JEToolkit/JESettings", "JEToolkit/JEToolkit", "JEToolkit/JEWeakCache", "Moya/Core", "Alamofire", "Result", "Moya/RxSwift", "Moya/Core", "RxSwift", "Result", "RxSwift", "SAMTextView", "SDVersion", "SDWebImage", "SDWebImage/Core", "SDWebImage/Core", "SwiftyJSON", "TLYShyNavBar", "TOCropViewController", "YLGIFImage", "CFPropertyList"]

session = Capybara::Session.new(:selenium)
LIB_NAMES.each do |name|
  session.visit "https://cocoapods.org/pods/#{name}"
  html = Nokogiri::HTML(session.html)
  l = html.at(%|table.header tr:contains('License')|).at('td:nth-child(2)').text rescue ""
  puts "#{name} #{l}"
end
