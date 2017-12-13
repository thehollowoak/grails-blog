require 'page-object'

include PageObject::PageFactory

Given(/^I visit the login page$/) do
  visit_page Login
end

When(/^I enter my information$/) do
  on_page Login do |page|
    page.user = 'user'
    page.password = 'pass'
    page.submit
  end
end

Then(/^I am logged in$/) do
  visit_page BlogPosts
  on_page BlogPosts do |page|
    expect(page.display).to include 'Create New Post'
  end
end

Given(/^I am logged in as a blogger$/) do
  visit_page Login
  on_page Login do |page|
    page.user = 'user'
    page.password = 'pass'
    page.submit
  end
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

Given(/^I visit a blog of my favorite blogger$/) do
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

When(/^I choose a blog post$/) do
  visit_page BlogPosts
  on_page BlogPosts do |page|
      page.view
  end
end

Then(/^I should see the blog post$/) do
  on_page View do |page|
    expect(page.display).to include 'Test new Entry'
  end
  visit_page BlogPosts
  on_page BlogPosts do |page|
    page.delete
    page.delete
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
  visit_page BlogPosts
  on_page BlogPosts do |page|
    page.delete
    page.delete
  end
end