package blog

class BootStrap {

    def init = { servletContext ->
        def aPost = new Post(title: 'TestTitle', date: new Date(), content: 'Hello World', author:'user').save()
        new Post(title: 'Test', date: new Date(), content: 'Good night World', author: 'user').save()
        new Comments(name: "Joe", postId: aPost.id, date: new Date(), text: "Hello Cats" ).save()
        new Blog(name: 'user', title:"John Smith's Blog").save()
        new User(username: 'user', password: 'pass', loggedin: false).save()
    }
    def destroy = {
    }
}
