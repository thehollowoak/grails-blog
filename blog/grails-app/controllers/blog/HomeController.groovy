package blog

class HomeController {

    def index() {
        def blogs = Blog.findAll()
        render(view:'index', model: [blogs: blogs])
    }

    def newUser() {
        render(view:'newUser', model: [invalid: params.invalid, taken: params.taken])
    }

    def save() {
        if (params.username == "" || params.password == "" || params.title == "") {
            redirect(uri: '/home/newUser?invalid=true')
        }
        else if (User.findByUsername(params.username)) {
            redirect(uri: '/home/newUser?taken=true')
        }
        else {
            new User(username: params.username, password: params.password, loggedin: true).save()
            new Blog(name: params.username, title: params.title).save()
            redirect(uri: "/${params.username}")
        }
    }
}
