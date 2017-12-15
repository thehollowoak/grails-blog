<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${content.title}</title>
</head>
<body class= 'container'>

<div id="content" role="main">
    <div class="row">
        <h1>${content.title}</h1>
         <h4 id="author-name">${content.name}</h4>
    </div>
    
    <div class="row">
        <g:if test="${blogger.loggedin}">
            <a href="/${content.name}/newPost" id="create-button" name="newpost" class="btn btn-success">Create New Post</a>
        </g:if>
    </div>
    <br/>
    <div class="row">
        <form action="/${content.name}/search" class="form-inline search" method="POST">
            <div class="form-group">
                <input type="text"
                   class="form-control" name="search"
                   placeholder="search">
                <button class="search-button btn btn-secondary" type="submit" name="search-button">Search</button>
            </div>
        </form>
    </div>
    <br/>

    <div class="row" id="success">
        <g:if test="${posts.size() > 0 && blogger.loggedin}">
            <g:if test="${use (groovy.time.TimeCategory) {groovy.time.TimeCategory.minus(new Date(), posts[0]?.date) < 10.seconds}}">
                <p>New post successfully created</p>
            </g:if>
        </g:if>
    </div>
    <g:each var="post" in="${posts.size() < 10 ? posts : posts.subList(0, 10)}">

        <div class="row">
            <h3>${post.title}</h3>
            <div class="row post-format">
                <g:if test="${post.content.length() > 500}">
                    <p>${post.content.substring(0, 500)}...
                        <a href="/${content.name}/${post.id}/${pageNumber}" name="view-link">Read More</a>
                    </p>
                </g:if>
                <g:else>
                    <p>${post.content}</p>
                    <a href="/${content.name}/${post.id}/${pageNumber}" name="view-link">View Post</a>
                </g:else>
            </div>
            <span>${post.date.format('MM/dd/yy hh:mm a')}</span>

            <span class="delete-button btn">
                <g:if test="${blogger.loggedin}">
                    <a href="/${content.name}/deletePost/${post.id}" name="delete-button" class="delete-button btn btn-default">Delete Post</a>
                </g:if>
            </span>
            </br>
        </div>
    </g:each>

    <br>
    <div class="row">
         <g:if test="${posts.size() > 10}">
            <a href="/${content.name}/page/${pageNumber.toInteger()+1}" class="next-button">Next Page</a>
        </g:if>
        <g:if test="${pageNumber.toInteger() > 2}">
            <a href="/${content.name}/page/${pageNumber.toInteger()-1}" class="previous-button">Previous Page</a>
        </g:if>
        <g:if test="${pageNumber.toInteger() == 2}">
            <a href="/${content.name}" class="previous-button">Previous Page</a>
        </g:if>
    </div>

</div>

</body>
</html>