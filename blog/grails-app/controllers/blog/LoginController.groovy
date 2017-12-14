package blog

class LoginController {

    def index() {

    }
    def verify(){
        def check = User.findByUsername(params.username)
        if(check.password == params.password){
            check.loggedin = true;
            redirect(uri: "/${check.username}")
        }
        else {
            redirect(uri: '/login')
        }


    }


}
