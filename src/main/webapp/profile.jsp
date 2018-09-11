<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Profile | GoodStay</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
</head>
<style>
    .form-control[disabled] {
        color: #7F8C8D !important;
        cursor: default;
        background-color: #f4f6f6;
        filter: alpha(opacity=70);
        border-color: #7F8C8D !important;
        opacity: .7;
    }
    .radio input[type="radio"].custom-radio:disabled:checked + .icons .icon-checked {
        color: #1ABC9C !important;
        filter: none;
        opacity: 1;
        -webkit-filter: none;
    }
</style>
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
        <div><h4>Personal Profile</h4></div>

        <div>
            <form>
                <div class="form-group">
                    <strong>User ID</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> User ID is generated automatically and can not be changed!</small>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="id" value="<%=user.getId()%>"/>
                </div>

                <div class="form-group">
                    <strong>Username</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> Your user name is the unique identifier, so it can not be changed since the account had been created!</small>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="username" value="<%=user.getUser_name()%>" />
                </div>

                <div class="form-group">
                    <strong>Email</strong> <span class="gs-color-dsun">*</span>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="email" value="<%=user.getEmail()%>" />
                </div>

                <div class="form-group"><strong>Nick name</strong></div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="name" value="<%=user.getName()%>" />
                </div>

                <div class="form-group">
                    <div class="list-text"><strong>Gender</strong></div>
                    <div class="list-input">
                        <label class="radio">
                            <input type="radio" disabled="disabled" name="gender" value="female" data-toggle="radio" <% if (isFemale) { %> checked <% }%> >Female
                        </label>
                        <label class="radio">
                            <input type="radio" disabled="disabled" name="gender" value="male" data-toggle="radio" <% if (isMale) { %> checked <% }%> >Male
                        </label>
                    </div>
                </div>

                <div class="form-group"><strong>Date of Birth</strong></div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="dob" value="<%=user.getDate_of_birth()%>" />
                </div>

                <div class="form-group"><strong>Mobile number</strong></div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="mobile" value="<%=user.getMobile()%>" />
                </div>

                <div class="form-group"><strong>Create date</strong></div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="create_date" value="<%=user.getCreate_date()%>" />
                </div>

                <div style="margin: 15px 0 10px 0;">
                    <a href="/EditProfileServlet?id=<%=user.getId()%>" class="btn btn-primary btn-embossed btn-block">Edit details</a>
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
