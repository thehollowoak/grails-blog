require 'page-object'

class NewPost
  include PageObject

  page_url "http://localhost:8080/blog/newPost"

  text_field(:title, :id => 'title')
  text_area(:entry, :id => 'composition')

  button(:submit, :name => 'save')

end