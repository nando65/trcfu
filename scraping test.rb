require 'open-uri'
require 'nokogiri'
require 'watir-webdriver'
require 'csv'

#url='https://www.coursetalk.com/search?q=machine+learning'

 # page =Nokogiri::HTML(open(url))
 browser = Watir::Browser.new :chrome
 #browser = Watir::Browser.new :chrome, driver_path: '/Users/fernandomartinez/Downloads/chromedriver'
 #browser = Watir::Browser.new :phantomjs
 browser.goto "https://www.coursetalk.com/search?q=machine+learning"
 puts "pagina web"
 sleep 2

  data = Nokogiri::HTML(browser.html)
  active_projects = data.css('.course-listing-card')

  #puts active_projects.first

#browser.button(:class => "btn btn-default btn-size-mini js-embed-course", :data_id => '70231').click
#puts browser.button(:class => "btn btn-default btn-size-mini js-embed-course").attribute_value("data-id")
sleep 5

  i=0
  active_projects.each do |course|


        id = active_projects[i].css('button').attribute('data-id').value
        puts id
        browser.button(:class => "btn btn-default btn-size-mini js-embed-course", :data_id => id).click
        sleep 5
        ajax_called_data = Nokogiri::HTML(browser.html)
        card_name = ajax_called_data.css('textarea').text.strip # card where project is
        #puts card_name
        browser.send_keys :escape
        sleep 5
        puts "Escaped #{i}"
  i=i+1
  #puts active_projects[i]
  #puts i+1
  end

#   link_to_individual_projects = []

# active_projects = data.css('.course-listing-card')

# active_projects.css('.btn btn-default btn-size-mini js-embed-course').each do |link_tag|
#   browser.link(:text => link_tag.text).when_present.click
#   sleep 1
#   ajax_called_data = Nokogiri::HTML(browser.html)
#   card_name = ajax_called_data.css('.embed-course-popup__snippet js-embed-snippet') # card where project is
  # link_to_project = card_name.css('a').attribute('href').value # href to project
  # link_to_individual_projects << link_to_project
#end



# page_numbers=page.css('.pagination__page-number').last.text


# name=[]

# page_numbers.to_i.times do |i|

#   url="https://www.coursetalk.com/search?filters=&page=#{i+1}&sort=-ct_score&q=machine%20learning"
#   page =Nokogiri::HTML(open(url))


# page.css('.course-listing__summary .course-listing-summary__name').each do |line|
#   name<<line.text.strip
# end
# end

# page_numbers.to_i.time do |i|
# end

# text=page.at('script')
