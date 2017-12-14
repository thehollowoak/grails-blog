<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>New Post</title>
</head>
<body>


<div id="content" role="main">
    <div class="well well-lg col-md-6">
        <form action="/${username}/save" method="POST">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text"
                       class="form-control" id="title" name="title"
                       placeholder="title">
            </div>
            <div class="form-group">
                <textarea class="form-control"  id="composition" name="content"></textarea>

            </div>
            <button type="submit" name="save" class="btn btn-primary">Save</button>
        </form>
    </div>
</div>

</body>
</html>