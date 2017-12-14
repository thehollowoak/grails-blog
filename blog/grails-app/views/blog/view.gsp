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
            <g:link action="index" class="back-button">Back</g:link>
        </g:if>
        <g:else>
            <g:link action="page" class="back-button" params="${[pageNumber: pageNumber]}">Back</g:link>
        </g:else>
    </div>
    <div class="row">
        <h3>Comments</h3>
        <g:form>
            <label for="author">Name: </label><g:textField name="author"/><br/>
            <label for="text">Leave a Comment: </label><br><g:textArea name="text"/><br/>
            <g:hiddenField name="postId" value="${post?.id}" />
            <g:submitToRemote url="[controller:'blog', action:'postComment']" name="post-comment" update="comments" value="Post"/>

        </g:form>
        <div class="row" id="comments">
        </div>
        <br>
        <g:each var="comment" in="${comments}">

            <div class="row">
                <h6>${comment.name}</h6>
                <p>${comment.text}</p>
            </div>

            </br>

        </g:each>
    </div>

</div>

</body>
</html>