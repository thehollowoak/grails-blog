package blog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        name view: "/blog/$postId/$title"{
            controller = "blog"
            action = "view"
        }
        name newPost: "/blog/newPost/$username"{
            controller = "blog"
            action = "newPost"
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
