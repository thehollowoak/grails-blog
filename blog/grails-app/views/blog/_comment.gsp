
<div class="row well">
    <h6>${comment.name}</h6>
    <div class="row">
        <p>${comment.text}</p>
    </div>
    <div class="col-sm-9">
        ${post.date.format('MM/dd/yy hh:mm a')}
    </div>
    <div class="col-sm-3">
    <g:if test="${blogger?.loggedin}">
        <g:link action="deleteComment" name="delete-button" params="${[commentId: comment.id, postId: post.id, pageNumber: pageNumber, username: post.author]}">Delete Comment</g:link>
    </g:if>
    </div>
</div>

</br>