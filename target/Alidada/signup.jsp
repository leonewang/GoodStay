<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Sign up | GoodStay</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/demo.css">
    <link rel="stylesheet" href="css/index.css">
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
                <a href="index.jsp"><img src="images/login/house.svg" alt="Welcome to GoodStay" /></a>
                <h4>
                    Welcome to <small>GoodStay</small>
                </h4>
            </div>
            <form role="form" action="/RegisterServlet" method="get" onsubmit="return checkSignup();">
                <div class="login-icon-hidden hidden-md hidden-lg">
                    <a href="index.jsp"><img src="images/login/chat.svg" alt="Welcome to GoodStay" /></a>
                    <h4>Welcome to GoodStay</h4>
                </div>
                <div class="login-form">
                    <div class="form-group">
                        <input type="text" class="form-control login-field" value="" placeholder="Email" id="email" name="email" /> <label
                            class="login-field-icon fui-user" for="email"></label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control login-field" value="" placeholder="Nickname" id="username" name="username" /> <label
                            class="login-field-icon fui-heart" for="username"></label>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control login-field" value="" placeholder="Password" id="password" name="password" /> <label
                            class="login-field-icon fui-lock" for="password"></label>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control login-field" value="" placeholder="Real name (optional)" id="name" name="name" /> <label
                            class="login-field-icon fui-user"></label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control login-field" value="" placeholder="Gender (male or female, optional)" id="gender" name="gender" /> <label
                            class="login-field-icon fui-radio-checked"></label>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control login-field" value="" placeholder="Birthday (yyyy-mm-dd, optional)" id="dob" name="dob" /> <label
                            class="login-field-icon fui-calendar"></label>
                    </div>

                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Sign up" />
                    <div class="row">
                        <a class="login-link col-xs-6" href="signin.jsp">Have a account? Sign in</a><a class="login-link col-xs-6"></a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /container -->
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script src="js/formCheck.js"></script>
</body>
</html>
