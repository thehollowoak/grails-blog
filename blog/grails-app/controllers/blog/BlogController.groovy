package blog

class BlogController {

    def index() {
        def content = Blog.findByName('JSmith')
        def posts = Post.findAllByAuthor('JSmith')
        render(view:'index', model: [content: content, posts: posts])
    }

    def newPost() {

    }

    def save(){
       // Post[] blogPost = [new Post(title: params.title, date: new Date(), content: params.content)]
      //  def theBlog = Blog.findByName('JSmith')
      //  theBlog.posts.add blogPost
       // theBlog.saveOrUpdate()
      //  render(view:'index')
    }


}
