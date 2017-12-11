package blog

class BootStrap {

    def init = { servletContext ->
        new Blog(name: 'JSmith', title:"John Smith's Blog").save()
    }
    def destroy = {
    }
}
