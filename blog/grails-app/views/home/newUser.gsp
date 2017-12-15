<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>New Blogger</title>
</head>
<body class="container">

<div id="content" role="main">
    <div class="col-sm-3"></div>
    <div class="well well-lg col-sm-6">
        <g:if test="${taken}">
            <p> That username is taken, please pick a different one </p>
        </g:if>
        <g:elseif test="${invalid}">
            <p> All fields must be filled out </p>
        </g:elseif>
        <g:else> <br/> </g:else>
        <form action="/home/save" method="POST">
            <div class="form-group">
                <label for="username">New Username</label>
                <input type="text" class="form-control" id="username" name="username">
            </div>
            <div class="form-group">
                <label for="password">New Password</label>
                <input type="text" class="form-control" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="title">Blog Title</label>
                <input type="text" class="form-control" id="title" name="title">
            </div>
            <br/>
            <button type="submit" name="save" class="btn btn-primary">Save</button>
        </form>
    </div>
</div>

</body>
</html>