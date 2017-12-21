package blog

class BootStrap {

    def init = { servletContext ->
        def aPost = new Post(title: 'TestTitle', date: new Date(), content: 'Hello World', author:'user').save()
        new Post(title: 'Test', date: new Date(), content: 'Good night World', author: 'user').save()
        new Post(title: 'Test2', date: new Date()-200, content: 'Good night World', author: 'user').save()
        new Post(title: 'Test2', date: new Date()-199, content: 'Good night World', author: 'user').save()
        new Post(title: 'Test2', date: new Date()-500, content: 'Good night World', author: 'user').save()
        new Post(title: 'Test3', date: new Date()-1000, content: 'Good night World', author: 'user').save()
        new Post(title: 'Test4', date: new Date()-5000, content: 'Good night World', author: 'user').save()
        new Post(title: 'Test5', date: new Date()-10000, content: 'Good night World', author: 'user').save()
        new Comments(name: "Joe", postId: aPost.id, date: new Date(), text: "Hello Cats" ).save()
        new Blog(name: 'user', title:"John Smith's Blog").save()
        new User(username: 'user', password: 'pass', loggedin: false).save()
    }
    def destroy = {
    }
}
