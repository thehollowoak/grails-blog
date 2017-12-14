package blog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        name home: "/" {
            controller = "home"
            action = "index"
        }

        name page: "/$username/page/$pageNumber" {
            controller = "blog"
            action = "page"
        }

        name blog: "/$username/$action?/$postId?" {
            controller = "blog"
        }

        name view: "/$username/$postId/$pageNumber/$title" {
            controller = "blog"
            action = "view"
        }

        name redirectView: "/$username/$postId/$pageNumber" {
            controller = "blog"
            action = "redirectView"
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
