class Course < ActiveRecord::Base

def self.insert_machine_learning_courses
browser = Watir::Browser.new :chrome, driver_path: '/Users/fernandomartinez/Downloads/chromedriver'
    browser.goto "https://www.coursetalk.com/search?q=machine+learning"
    sleep 2
    data = Nokogiri::HTML(browser.html)
    active_courses = data.css('.course-listing-card')
    sleep 5
    i=0
    @all_links=[]
    active_courses.each do
        id = active_courses[i].css('button').attribute('data-id').value
        browser.button(:class => "btn btn-default btn-size-mini js-embed-course", :data_id => id).click
        sleep 5
        ajax_called_data = Nokogiri::HTML(browser.html)
        course_link = ajax_called_data.css('textarea').text.strip # card where project is
        @all_links<<course_link
        browser.send_keys :escape
        sleep 5
        i=i+1
    end

        @all_links.each do |a|
          b=Course.new
          b.link=a
          b.save
        end
end
end
