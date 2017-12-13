package blog

class BootStrap {

    def init = { servletContext ->
        def aPost = new Post(title: 'TestTitle', date: new Date(), content: 'Hello World', author:'JSmith').save()
        new Post(title: 'Test', date: new Date(), content: 'Good night World', author: 'JSmith').save()
        new Comments(name: "Joe", postId: aPost.id, date: new Date(), text: "Hello Cats" ).save()
        new Blog(name: 'JSmith', title:"John Smith's Blog").save()
    }
    def destroy = {
    }
}
