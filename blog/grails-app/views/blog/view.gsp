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

</div>

</body>
</html>