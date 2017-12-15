<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${post?.title}</title>
</head>
<body class= 'container'>

<div id="content" role="main">
    <div class="row">
        <h1>${post?.title}</h1>
        <h4 id="author-name">${post?.author}</h4>
    </div>

</br>

    <div class="row">
        <p>
            ${post.content}
        </p>
    </div>

    <br>
    <div class="row">
        <g:if test="${pageNumber.toInteger() == 1}">
            <a href="/${post.author}" class="back-button">Back</a>
        </g:if>
        <g:else>
            <a href="/${post.author}/page/${pageNumber}" class="back-button">Back</a>
        </g:else>
    </div>
    <br/>
    <div class="row">
        <g:form>
            <label for="author">Name: </label><g:textField name="author"/><br/>
            <label for="text">Leave a Comment: </label><br><g:textArea name="text"/><br/>
            <g:hiddenField name="postId" value="${post?.id}" />
            <g:submitToRemote url="[controller:'blog', action:'postComment']" name="post-comment" update="comments" value="Post"/>
        </g:form>

        <h3>Comments</h3>
        <div class="row" id="comments">
        </div>
        <br>
        <g:each var="comment" in="${comments}">

            <div class="row well">
                <h6>${comment.name}</h6>
                <div class="row">
                    <p>${comment.text}</p>
                </div>
                <div class="col-sm-9">
                    ${post.date.format('MM/dd/yy hh:mm a')}
                </div>
                <div class="col-sm-3">
                <g:if test="${blogger.loggedin}">
                    <g:link action="deleteComment" name="delete-button" params="${[commentId: comment.id, postId: post.id, pageNumber: pageNumber, username: post.author]}">Delete Comment</g:link>
                </g:if>
                </div>
            </div>

            </br>

        </g:each>
    </div>

</div>

</body>
</html>