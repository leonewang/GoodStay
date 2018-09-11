<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Post | UNSW BOOK</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
</head>
<body style="padding-top: 70px;">
<!-- /custom navbar -->
<%@include file="nav.jsp"%>
<div class="container">
    <div>
        <div><h4>Post Message</h4></div>
        <div>
            <form action="/PostServlet" method="post">
                <input type="text" name="id" value="<%=user.getId()%>" hidden/>
                <div class="form-group">
                    <strong>Message</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> The length of content should less than 200 characters!</small>
                </div>
                <div class="form-group">
                    <textarea class="form-control" rows="5" name="message" placeholder="Within 200 characters ..."></textarea>
                </div>

                <div class="form-group">
                    <strong>URL</strong>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="url" placeholder="https://google.com" />
                </div>

                <div class="form-group">
                    <strong>Photo</strong>
                    <span class="gs-color-dsun">*</span>
                    <small class="gs-color-dsun gs-text-sm"> Only one photo will be accepted!</small>
                </div>
                <div class="form-group">
                    <input type="file" class="form-control" name="image" accept="image/png, image/jpeg"/>
                </div>

                <div style="margin: 15px 0 10px 0;">
                    <button type="submit" class="btn btn-primary btn-embossed btn-block">Post Message</button>
                </div>

                <div>
                    <p class="gs-color-dclouds gs-text-md">
                        By clicking 'Post Message' button, you are willing to share you personal infomation to the internet.
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
</body>
</html>
