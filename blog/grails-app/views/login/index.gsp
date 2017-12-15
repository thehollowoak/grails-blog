<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
</head>
<body class="container">

<div class="row align-items-center justify-content-center" id="content" role="main">
    <div class="well well-lg col-md-6">
        <g:if test="${invalid}">
            <p id="invalid"> Username or password is invalid </p>
        </g:if>
        <g:else> <br/> </g:else>
        <form action="/login/verify" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text"
                       class="form-control" id="username" name="username"
                       placeholder="Username">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password"
                       class="form-control" id="password" name="password"
                       placeholder="Password">
            </div>
            <button type="submit" name="login" class="btn btn-primary">Log In</button>
        </form>
    </div>
</div>

</body>
</html>