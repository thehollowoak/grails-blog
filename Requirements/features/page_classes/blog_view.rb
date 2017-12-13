require 'page-object'

class View
  include PageObject

  page_url "http://localhost:8080/blog/view"

  div(:display, :id => 'content')
end