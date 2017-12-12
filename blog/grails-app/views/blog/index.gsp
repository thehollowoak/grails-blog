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
         <a href="/blog/newPost" id="create-button" name="newpost" class="btn btn-primary">Create New Post</a>
    </div>

    <div class="row" id="success">
        <g:if test="${use (groovy.time.TimeCategory) {groovy.time.TimeCategory.minus(new Date(), posts[0]?.date) < 10.seconds}}">
            <p>New post successfully created</p>
        </g:if>
    </div>
    <g:each var="post" in="${posts}">
        <div class="row">
            <h3>${post.title}</h3>
            <div class="row post-format">
                <p>${post.content}</p>
            </div>
        </div>
    </g:each>
    <br>

</div>

</body>
</html>