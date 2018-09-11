<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Edit | GoodStay</title>
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
<%
    Boolean isFemale;
    Boolean isMale;
    if (user.getGender().equals("female")) {
        isFemale = true;
        isMale = false;
    } else {
        isMale = true;
        isFemale = false;
    }
%>
<div class="container">
    <div>
        <div><h4>Edit Profile</h4></div>
        <div>
            <form action="/EditProfileServlet" method="post">
                <div class="form-group">
                    <input type="text" name="id" value="<%=user.getId()%>" hidden/>
                </div>


                <div class="form-group">
                    <strong>Username</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> Your user name is the unique identifier, so it can not be changed since the account had been created!</small>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="username" placeholder="<%=user.getUser_name()%>" />
                </div>

                <div class="form-group">
                    <strong>Password</strong> <span class="gs-color-dsun">*</span>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" value="<%=user.getPassword()%>" />
                </div>

                <div class="form-group">
                    <strong>Email</strong> <span class="gs-color-dsun">*</span>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="email" value="<%=user.getEmail()%>" />
                </div>

                <div class="form-group"><strong>Nick name</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="<%=user.getName()%>" />
                </div>

                <div class="form-group">
                    <div class="list-text"><strong>Gender</strong></div>
                    <div class="list-input">
                        <label class="radio">
                            <input type="radio" name="gender" value="female" data-toggle="radio" <% if (isFemale) { %> checked <% }%> >Female
                        </label>
                        <label class="radio">
                            <input type="radio" name="gender" value="male" data-toggle="radio" <% if (isMale) { %> checked <% }%> >Male
                        </label>
                    </div>
                </div>

                <div class="form-group"><strong>Date of Birth</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="dob" value="<%=user.getDate_of_birth()%>" />
                </div>

                <div class="form-group"><strong>Mobile number</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="mobile" value="<%=user.getMobile()%>" />
                </div>

                <div style="margin: 15px 0 10px 0;">
                    <button type="submit" class="btn btn-primary btn-embossed btn-block">Save changes</button>
                </div>

                <div>
                    <p class="gs-color-dclouds gs-text-md">
                        By clicking 'Save changes' button, your basic infomation details will be saved to the server of GoodStay, so make sure that you input the right information in the right field. And the value of "Date of Birth" field should follow the format "yyyy-mm-dd".
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
