package blog

class BlogController {

    def index() {
        def blogger = User.findByUsername(session.getAttribute("username"))
        def content = Blog.findByName(params.username)
        def posts = Post.findAllByAuthor(params.username)
        def fullPosts = posts
        posts = posts.sort{a,b -> b.date <=> a.date}
        def pageNumber = 1
        render(view:'index', model: [content: content, posts: posts, fullPosts: fullPosts, pageNumber: pageNumber, blogger: blogger])
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
        def blogger = User.findByUsername(session.getAttribute("username"))
        def content = Blog.findByName(params.username)
        def posts = Post.findAllByAuthor(params.username)
        def fullPosts = posts
        posts = posts.sort { a, b -> b.date <=> a.date}
        posts = posts.subList(params.pageNumber.toInteger() * 10 - 10, posts.size())
        render(view:'index', model: [content: content, posts: posts, fullPosts: fullPosts, pageNumber: params.pageNumber, blogger: blogger])
    }

    def search(){
        def blogger = User.findByUsername(session.getAttribute("username"))
        def content = Blog.findByName(params.username)
        def posts = Post.findAllByAuthorAndTitleIlike(params.username, "%${params.search}%")
        def fullPosts = Post.findAllByAuthor(params.username)
        def pageNumber = 1
        render(view:'index', model: [content: content, posts: posts, fullPosts: fullPosts, pageNumber: pageNumber, blogger: blogger])
    }

    def view(){
        def blogger = User.findByUsername(session.getAttribute("username"))
        def content = Blog.findByName(params.username)
        def post = Post.findById(params.postId)
        def comments = Comments.findAllByPostId(params.postId)
        def fullPosts = Post.findAllByAuthor(params.username)
        comments = comments.reverse()
        render(view:'view', model: [content: content, post: post, fullPosts: fullPosts, pageNumber: params.pageNumber, comments: comments, blogger: blogger])
    }

    def redirectView() {
        def title = Post.findById(params.postId).formatURL()
        redirect(uri: "/${params.username}/${params.postId}/${params.pageNumber}/${title}")
    }
    
    def postComment(){
        def blogger = User.findByUsername(session.getAttribute("username"))
        def post = Post.findById(params.postId)
        def newComment = new Comments(text: params.text, postId: params.postId, name: params.author, date: new Date()).save()
        render(template: 'comment', model:[comment: newComment, post: post, pageNumber: params.pageNumber, blogger: blogger])
    }

    def deleteComment() {
        Comments.findById(params.commentId).delete(flush: true)
        redirect(uri: "/${params.username}/${params.postId}/${params.pageNumber}")
    }

    def logout(){
        def check = User.findByUsername(session.getAttribute("username"))
        check.loggedin = false
        check.save(flush: true)
        session.invalidate()
        redirect(uri: "/home")
    }

}
