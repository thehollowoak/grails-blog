require 'page-object'

class View
  include PageObject

  page_url "http://localhost:8080/blog/view"

  div(:display, :id => 'content')
  text-area(:comment, :id => 'comment')
  buton(:submit, :id => 'comment-button')
end