package blog

class BootStrap {

    def init = { servletContext ->
        def blogPost = [new Post(title: 'TestTitle', date: new Date(), content: 'Hello World')]
        new Blog(name: 'JSmith', title:"John Smith's Blog", posts: blogPost).save()
    }
    def destroy = {
    }
}
