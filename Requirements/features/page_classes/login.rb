require 'page-object'

class Login
  include PageObject

  page_url "http://localhost:8080/login"

  text_field(:user, :id => 'username')
  text_field(:password, :id => 'password')

  button(:submit, :name => 'login')
end