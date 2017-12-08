require 'page-object'

class Login
  include PageObject

  page_url "http://localhost:8080/blog/login"

  text_field(:user, :id -> 'user')
  text_field(:password, :id -> 'password')

  button(:submit, :id -> 'submit')
end