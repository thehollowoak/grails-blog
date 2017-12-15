<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Blog</title>
</head>
<body class="container">
    <div id="content" role="main" class="row">
        
        <h1>Welcome to Blog</h1>
        <br/>
        <a href="/login">Blogger Login</a> <br/>
        <a href="/home/newUser">Blogger Signup</a>
        <br/><br/>
        <div>
            <h4> Read a blog: </h4>
            <ul>
                <g:each var="blog" in="${blogs}">
                    <li> <a href="/${blog.name}">${blog.name}</a> </li>
                </g:each>
            </ul>
        </div>

    </div>
</body>
</html>