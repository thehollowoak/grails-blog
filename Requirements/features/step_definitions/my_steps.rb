require 'page-object'

include PageObject::PageFactory

Given(/^I am logged in as a blogger$/) do
  # loggin happens in hooks
end

When(/^I publish a new blog post$/) do
  visit_page NewPost
  on_page NewPost do |page|
    page.title = 'Test Title'
    page.entry = 'Test Entry'
    page.submit
  end
end

Then(/^I am notified that the blog post was successfully added$/) do
  visit_page BlogPosts
  on_page BlogPosts do |page|
    expect(page.success).to include 'New post successfully created'
  end
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
  on_page BlogPosts do |page|
    expect(page.display).to include 'Test Title'
  end
end

Given(/^my favorite blogger has been very active$/) do
  (1..11).each do |i|
    visit_page NewPost
    on_page NewPost do |page|
     page.title = "Test #{i} Title"
     page.entry = "Test #{i} Entry"
     page.submit
    end
  end
end

When(/^I visit the blog for my favorite blogger$/) do
  visit_page BlogPosts
end

Then(/^I should see a summary of my favorite blogger's (\d+) most recent posts in reverse order$/) do |arg|
  on_page BlogPosts do |page|
    expect(page.display).to include 'Test 2 Title'
    expect(page.display).to include 'Test 11 Title'
    expect(page.display).not_to include 'Test 1 Title'
  end

  on_page BlogPosts do |page|
    (1..11).each do
      page.delete
    end
  end
end

When(/^I choose a blog post$/) do
  visit_page BlogPosts
  on_page BlogPosts do |page|
      page.view
  end
end

Then(/^I should see the blog post$/) do
  on_page View do |page|
    expect(page.display).to include 'Test alt Entry'
  end
end

When(/^I search for a blog post$/) do
  visit_page BlogPosts
  on_page BlogPosts do |page|
    page.search = "new"
    page.submit_search
  end
end

Then(/^I should see posts with that value in the title$/) do
  on_page BlogPosts do |page|
    expect(page.display).to include 'new'
    expect(page.display).not_to include 'alt'
  end
end

Then(/^I should see comments left by other readers$/) do
  on_page View do |page|
    expect(page.display).to include 'Comments'
  end
end

Given(/^I am reading a blog post from my favorite blogger$/) do
  visit_page BlogPosts
  on_page BlogPosts do |page|
    page.view
  end

end

When(/^I add my genius comment to the blog post$/) do
  on_page View do |page|
    page.author = "Cat_Lover99"
    page.comment = "I love cats!"
    page.submit
  end
end

Then(/^my genius comment is at the top of the blog post comments$/) do
  on_page View do |page|
    expect(page.display).to include 'I love cats!'
    @browser.refresh
    page.delete
  end
end

Then(/^the url should contain information about the post$/) do
  on_page View do |page|
    expect(@browser.url).to include "Test-alt-Title"
  end
end