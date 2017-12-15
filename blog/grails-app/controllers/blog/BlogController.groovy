package blog

class BlogController {

    def index() {
        def blogger = User.findByUsername(params.username)
        def content = Blog.findByName(params.username)
        def posts = Post.findAllByAuthor(params.username)
        posts = posts.sort{a,b -> b.date <=> a.date}
        def pageNumber = 1
        render(view:'index', model: [content: content, posts: posts, pageNumber: pageNumber, blogger: blogger])
    }

    def newPost() {
        render(view: 'newPost', model: [username: params.username])
    }

    def save() {
        new Post(title: params.title, date: new Date(), content: params.content, author: params.username).save()
        redirect(uri: "/${params.username}")
    }

    def deletePost() {
        Post.findById(params.postId).delete(flush: true)
        redirect(uri: "/${params.username}")
    }

    def page(){
        def blogger = User.findByUsername(params.username)
        def content = Blog.findByName(params.username)
        def posts = Post.findAllByAuthor(params.username)
        posts = posts.sort { a, b -> b.date <=> a.date}
        posts = posts.subList(params.pageNumber.toInteger() * 10 - 10, posts.size())
        render(view:'index', model: [content: content, posts: posts, pageNumber: params.pageNumber, blogger: blogger])
    }

    def search(){
        def blogger = User.findByUsername(params.username)
        def content = Blog.findByName(params.username)
        def posts = Post.findAllByAuthorAndTitleIlike(params.username, "%${params.search}%")
        def pageNumber = 1
        render(view:'index', model: [content: content, posts: posts, pageNumber: pageNumber, blogger: blogger])
    }

    def view(){
        def blogger = User.findByUsername(params.username)
        def post = Post.findById(params.postId)
        def comments = Comments.findAllByPostId(params.postId)
        comments = comments.reverse()
        render(view:'view', model: [post: post, pageNumber: params.pageNumber, comments: comments, blogger: blogger])

    }

    def redirectView() {
        def title = Post.findById(params.postId).formatURL()
        redirect(uri: "/${params.username}/${params.postId}/${params.pageNumber}/${title}")
    }
    
    def postComment(){
        def message = params.text
        def newComment = new Comments(text: message, postId: params.postId, name: params.author, date: new Date()).save()
        render(template: 'comment', model:[newComment: newComment])
    }

    def deleteComment() {
        Comments.findById(params.commentId).delete(flush: true)
        redirect(uri: "/${params.username}/${params.postId}/${params.pageNumber}")
    }

}
