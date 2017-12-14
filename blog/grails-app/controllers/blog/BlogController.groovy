package blog

class BlogController {

    def index() {
        def content = Blog.findByName('JSmith')
        def posts = Post.findAllByAuthor('JSmith')
        posts = posts.sort{a,b -> b.date <=> a.date}
        def pageNumber = 1
        render(view:'index', model: [content: content, posts: posts, pageNumber: pageNumber])
    }

    def newPost() {}

    def save() {
        new Post(title: params.title, date: new Date(), content: params.content, author: 'JSmith').save()
        redirect(uri: '/blog/index')
    }

    def delete() {
        Post.findById(params.postId).delete(flush: true)
        redirect(uri: '/blog/index')
    }

    def page(){
        def content = Blog.findByName('JSmith')
        def posts = Post.findAllByAuthor('JSmith')
        posts = posts.sort { a, b -> b.date <=> a.date}
        posts = posts.subList(params.pageNumber.toInteger() * 10 - 10, posts.size())
        render(view:'index', model: [content: content, posts: posts, pageNumber: params.pageNumber])
    }

    def view(){
        def post = Post.findById(params.postId)
        def comments = Comments.findAllByPostId(params.postId)
        //def comments = Comments.findAll()
        comments = comments.reverse()
        render(view:'view', model: [post: post, pageNumber: params.pageNumber, comments: comments])

    }

    def search(){
        def content = Blog.findByName('JSmith')
        def posts = Post.findAllByAuthorAndTitleIlike('JSmith', "%${params.search}%")
        def pageNumber = 1
        render(view:'index', model: [content: content, posts: posts, pageNumber: pageNumber])
    }
    def postComment(){
        def message = params.text
        def newComment = new Comments(text: message, postId: params.postId, name: params.author, date: new Date()).save()
        render(template: 'comment', model:[newComment: newComment])
    }

}
