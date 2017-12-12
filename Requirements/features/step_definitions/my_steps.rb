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