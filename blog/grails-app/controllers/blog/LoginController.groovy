package blog

class LoginController {

    def index() {
        render(view:'index', model: [invalid: params.invalid])
    }

    def verify(){
        def check = User.findByUsername(params.username)
        if(check?.password == params.password){
            check.loggedin = true
            check.save(flush: true)
            redirect(uri: "/${check.username}")
        }
        else {
            redirect(uri: '/login?invalid=true')
        }
    }

}
