<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Failed | GoodStay</title>
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

<%
    String warning_msg = (String) request.getAttribute("warning");
%>

<div class="container">
    <div class="login">
        <div class="login-screen" style="padding: 123px 199px 33px 306px !important;">
            <div class="login-icon hidden-sm hidden-xs">
                <a href="index.jsp"><img src="images/login/house.svg" alt="Welcome to GoodStay" /></a>
                <h4>
                    Welcome to <small>GoodStay</small>
                </h4>
            </div>
            <form role="form">
                <div class="login-icon-hidden hidden-md hidden-lg">
                    <a href="index.jsp"><img src="images/login/house.svg" alt="Welcome to GoodStay" /></a>
                    <h4>Welcome to GoodStay</h4>
                </div>
                <div class="login-form">
                    <span class="fui-cross-circle" style="color: #E74C3C;"> Oops!</span>
                    <small class="activate"><%=warning_msg%></small>
                    <a class="btn btn-primary btn-lg btn-block" href="signin.jsp">Back to Signin</a>
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
</body>
</html>
