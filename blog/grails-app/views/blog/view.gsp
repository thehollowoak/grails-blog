<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:javascript src="application.js"/>
    <title>${post?.title}</title>
</head>
<body class= 'container'>

<div id="content" role="main">
    <div class="row">
        <h1>${post?.title}</h1>
        <h4 id="author-name">${post?.author}</h4>
    </div>

</br>

    <div id="side-bar" class="row">

        <h2>
            Archives
        </h2>

        <g:each var="i" in="${0..<fullPosts.size()}">

            <g:if test="${i == 0}">
                <div id="${fullPosts[i].date.format('yyyy')}">
                ${fullPosts[i].date.format('yyyy')}
                <button class="clear-button" data-toggle="collapse" data-target="#${fullPosts[i].date.format('yyyy')}-months">></button>
                <div id="${fullPosts[i].date.format('yyyy')}-months" class="collapse">
                                        <div class="row" id="${fullPosts[i].date.format('YYYY-MMMM')}">
                ${fullPosts[i].date.format('MMMM')}
                <button class="clear-button" data-toggle="collapse" data-target="#${fullPosts[i].date.format('YYYY-MMMM')}-post-links">></button>
                <div class="row collapse" id="${fullPosts[i].date.format('YYYY-MMMM')}-post-links">
                <a href="/${content.name}/${fullPosts[i].id}/${pageNumber}" name="view-link">${fullPosts[i].title}</a>
                <g:if test="${i == fullPosts.size()-1}">
                                </div>
                            </div>
                        </div>
                    </div>
                </g:if>
            </g:if>
            <g:elseif test="${(fullPosts[i].date.format('yyyy') == fullPosts[i-1].date.format('yyyy')) && (fullPosts[i].date.format('MMMM') == fullPosts[i-1].date.format('MMMM'))}">
                <br>
                <a href="/${content.name}/${fullPosts[i].id}/${pageNumber}" name="view-link">${fullPosts[i].title}</a>
                <g:if test="${i == fullPosts.size()-1}">
                                </div>
                            </div>
                        </div>
                    </div>
                </g:if>
            </g:elseif>
            <g:elseif test="${(fullPosts[i].date.format('yyyy') == fullPosts[i-1].date.format('yyyy')) && (fullPosts[i].date.format('MMMM') != fullPosts[i-1].date.format('MMMM'))}">
                </div>
                </div>
                <div class="row" id="${fullPosts[i].date.format('YYYY-MMMM')}">
                ${fullPosts[i].date.format('MMMM')}
                <button class="clear-button" data-toggle="collapse" data-target="#${fullPosts[i].date.format('YYYY-MMMM')}-post-links">></button>
                <div class="row collapse" id="${fullPosts[i].date.format('YYYY-MMMM')}-post-links">
                <a href="/${content.name}/${fullPosts[i].id}/${pageNumber}" name="view-link">${fullPosts[i].title}</a>
                <g:if test="${i == fullPosts.size()-1}">
                                </div>
                            </div>
                        </div>
                    </div>
                </g:if>
            </g:elseif>
            <g:elseif test="${(fullPosts[i].date.format('yyyy') != fullPosts[i-1].date.format('yyyy')) && (fullPosts[i].date.format('MMMM') != fullPosts[i-1].date.format('MMMM'))}">
                </div>
                </div>
                </div>
                </div>
                <div id="${fullPosts[i].date.format('yyyy')}">
                ${fullPosts[i].date.format('yyyy')}
                <button class="clear-button" data-toggle="collapse" data-target="#${fullPosts[i].date.format('yyyy')}-months">></button>
                <div id="${fullPosts[i].date.format('yyyy')}-months" class="collapse">
                                        <div class="row" id="${fullPosts[i].date.format('YYYY-MMMM')}">
                ${fullPosts[i].date.format('MMMM')}
                <button class="clear-button" data-toggle="collapse" data-target="#${fullPosts[i].date.format('YYYY-MMMM')}-post-links">></button>
                <div class="row collapse" id="${fullPosts[i].date.format('YYYY-MMMM')}-post-links">
                <a href="/${content.name}/${fullPosts[i].id}/${pageNumber}" name="view-link">${fullPosts[i].title}</a>
                <g:if test="${i == fullPosts.size()-1}">
                                </div>
                            </div>
                        </div>
                    </div>
                </g:if>
            </g:elseif>

        </g:each>
        <br>
    </div>>

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
            <label for="author">Name: </label><g:textField name="author" id="author"/><br/>
            <label for="text">Leave a Comment: </label><br><g:textArea name="text" id="text"/><br/>
            <g:hiddenField name="postId" value="${post.id}" />
            <g:hiddenField name="pageNumber" value="${pageNumber}" />
            <g:submitToRemote url="[controller:'blog', action:'postComment']" id="post-comment" name="post-comment" update="comments" value="Post"/>
        </g:form>

        <h3>Comments</h3>
        <br/>
        <div id="comments">
        </div>
        <g:each var="comment" in="${comments}">
            <g:render template="/blog/comment" model="[comment: comment, post: post, pageNumber: pageNumber]"/>
        </g:each>
    </div>

</div>

<g:javascript>
    $("#post-comment").click(function() {
        $("#author").val("");
        $("#text").val("");
    });
</g:javascript>

</body>
</html>