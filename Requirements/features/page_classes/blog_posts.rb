require 'page-object'

class BlogPosts
  include PageObject

  page_url "http://localhost:8080/blog/"

  div(:display, :id => 'content')
  div(:success, :id => 'success')
  link(:delete, :name => 'delete-button')
  link(:view, :name => 'view-button')
  text_field(:search, :name => 'search')
  button(:submit_search, :name => 'search-button')
end