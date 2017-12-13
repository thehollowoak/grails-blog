<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${content?.title}'s Blog</title>
</head>
<body class= 'container'>




<div id="content" role="main">
    <div class="row">
        <h1>${content?.title}</h1>
         <h4 id="author-name">${content?.name}</h4>
    </div>
    
    <div class="row">
         <a href="/blog/newPost" id="create-button" name="newpost" class="btn btn-success">Create New Post</a>
    </div>
    </br>

    <div class="row" id="success">
        <g:if test="${use (groovy.time.TimeCategory) {groovy.time.TimeCategory.minus(new Date(), posts[0]?.date) < 10.seconds}}">
            <p>New post successfully created</p>
        </g:if>
    </div>
    <g:each var="post" in="${posts.size() < 10 ? posts : posts.subList(0, 10)}">

        <div class="row">
            <h3>${post.title}</h3>
            <div class="row post-format">
                <p>${post.content}</p>
            </div>
            <span class="delete-button btn">
                <g:link action="delete" name="delete-button" params="${[postId: post.id]}">Delete Post</g:link>
            </span>
            </br>
        </div>
    </g:each>
    <br>
    <div class="row">
         <g:if test="${posts.size() > 10}">
            <g:link action="page" class="next-button" params="${[pageNumber: pageNumber.toInteger()+1]}">Next Page</g:link>
        </g:if>
        <g:if test="${pageNumber.toInteger() > 2}">
            <g:link action="page" class="previous-button" params="${[pageNumber: pageNumber.toInteger()-1]}">Previous Page</g:link>
        </g:if>
        <g:if test="${pageNumber.toInteger() == 2}">
            <g:link action="index" class="previous-button">Previous Page</g:link>
        </g:if>
    </div>

</div>

</body>
</html>