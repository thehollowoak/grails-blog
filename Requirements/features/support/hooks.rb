require 'watir'

Before do |scenario|
  @browser=Watir::Browser.new :firefox
  
  visit_page Login
  on_page Login do |page|
    page.user = 'user'
    page.password = 'pass'
    page.submit
  end
  
  visit_page NewPost
  on_page NewPost do |page|
    page.title = "Test new Title"
    page.entry = "Test new Entry"
    page.submit
  end
  visit_page NewPost
  on_page NewPost do |page|
    page.title = "Test alt Title"
    page.entry = "Test alt Entry"
    page.submit
  end
end

After do |scenario|
  visit_page BlogPosts
  on_page BlogPosts do |page|
    page.delete
    page.delete
  end
  @browser.close
end