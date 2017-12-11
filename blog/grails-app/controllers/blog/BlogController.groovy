package blog

class BlogController {

    def index() {
        def content = Blog.first()
        render(view:'index', model: [content: content])
    }
}
