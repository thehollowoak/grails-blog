require 'page-object'

class BlogPosts
  include PageObject

  page_url "http://localhost:8080/blog/"

  div(:display, :id => 'content')
  div(:success, :id => 'success')
  link(:delete, :name => 'delete-button')
end