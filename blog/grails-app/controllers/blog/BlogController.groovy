package blog

class BlogController {

    def index() {
        def content = Blog.findByName('JSmith')
        def posts = Post.findAllByAuthor('JSmith')
        posts = posts.sort{a,b -> b.date <=> a.date}
        render(view:'index', model: [content: content, posts: posts])
    }

    def newPost() {

    }

    def save(){
        new Post(title: params.title, date: new Date(), content: params.content, author: 'JSmith').save()
        redirect(uri: '/blog/index')
    }


}
