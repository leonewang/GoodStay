<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Sign in | </title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/demo.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
</head>
<body>
<div id="error" class="alert alert-danger alert-dismissible" role="alert">
    <p align="center" class="gs-text-sm"><span class="fui-cross-circle"></span>&nbsp;&nbsp;&nbsp;<small id="error-message">{message}</small></p>
</div>

<div class="container">
    <div class="login">
        <div class="login-screen">
            <div class="login-icon hidden-sm hidden-xs">
                <a href="index.jsp"><img src="images/login/chat.svg" alt="Welcome to GoodStay" /></a>
                <h4>
                    Welcome to <small><a style="color: #fff;" href="adminSignin.jsp">GoodStay</a></small>
                </h4>
            </div>
            <form role="form" action="/LoginServlet" method="post" onsubmit="return checkSignin();">
                <div class="login-icon-hidden hidden-md hidden-lg">
                    <a href="index.jsp"><img src="images/login/chat.svg" alt="Welcome to GoodStay" /></a>
                    <h4>Welcome to GoodStay</h4>
                </div>
                <div class="login-form">
                    <div class="form-group">
                        <input type="text" class="form-control login-field" value="" placeholder="Enter your name" id="login-name" name="username" /> <label
                            class="login-field-icon fui-user" for="login-name"></label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control login-field" value="" placeholder="Password" id="login-pass" name="password" /> <label
                            class="login-field-icon fui-lock" for="login-pass"></label>
                    </div>
                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Sign in" />
                    <div class="row">
                        <a class="login-link col-xs-6" href="/findPassword.jsp">Lost your password?</a> <a class="login-link col-xs-6" href="index.jsp">Sign up</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /container -->
<!-- Le javascript
================================================== -->
<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script src="js/formCheck.js"></script>
</body>
</html>
