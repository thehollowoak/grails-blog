package blog

class HomeController {

    def index() {
        def blogs = Blog.findAll()
        render(view:'index', model: [blogs: blogs])
    }
}
