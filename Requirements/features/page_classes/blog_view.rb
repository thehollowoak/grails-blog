require 'page-object'

class View
  include PageObject

  page_url "http://localhost:8080/blog/view"

  div(:display, :id => 'content')
  text_field(:author, :name => 'author')
  textarea(:comment, :name => 'text')
  button(:submit, :name => 'post-comment')
  link(:delete, :name => 'delete-button')
end