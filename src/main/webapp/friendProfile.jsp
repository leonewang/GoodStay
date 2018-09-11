<%@ page import="model.User" %>
<%@ page import="model.Friend" %>
<%@ page import="dao.DBDao" %>
<%@ page import="java.sql.SQLException" %>
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
    Friend friend = (Friend) request.getAttribute("friend");
    Boolean isFriend = null;
    try {
        isFriend = dbdao.checkFriendship(user.getId(), friend.getId());
    } catch (SQLException e) {
        e.printStackTrace();
    }

    Boolean isFemale;
    Boolean isMale;
    if (friend.getGender().equals("female")) {
        isFemale = true;
        isMale = false;
    } else {
        isMale = true;
        isFemale = false;
    }
%>
<div class="container">
    <div>
        <div><h4>User Profile</h4></div>

        <div>
            <form>
                <div class="form-group">
                    <strong>User ID</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> User ID can not be searched!</small>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="id" value="<%=friend.getId()%>"/>
                </div>

                <div class="form-group">
                    <strong>Username</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> The user name is the unique identifier for search.</small>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="username" value="<%=friend.getUser_name()%>" />
                </div>

                <div class="form-group">
                    <strong>Email</strong> <span class="gs-color-dsun">*</span>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="email" value="<%=friend.getEmail()%>" />
                </div>

                <div class="form-group"><strong>Nick name</strong></div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="name" value="<%=friend.getName()%>" />
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
                    <input type="text" disabled="disabled" class="form-control" name="dob" value="<%=friend.getDate_of_birth()%>" />
                </div>

                <div class="form-group"><strong>Mobile number</strong></div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="mobile" value="<%=friend.getMobile()%>" />
                </div>

                <div class="form-group"><strong>Create date</strong></div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="create_date" value="<%=friend.getCreate_date()%>" />
                </div>

                <div style="margin: 15px 0 10px 0;">
                    <a id="add-friend" user-id="<%=user.getId()%>" friend-id="<%=friend.getId()%>" user-name="<%=user.getUser_name()%>" friend-name="<%=friend.getUser_name()%>" email="<%=friend.getEmail()%>" class="btn btn-primary btn-embossed btn-block" <% if (isFriend) { %>disabled="disable">You are friends now<% } else { %>>Add as a friend<% } %></a>
                </div>

                <div>
                    <p class="gs-color-dclouds gs-text-md">
                        By clicking 'Add as a friend' button, a system veritfy email will be sent to the user.
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#add-friend').click(function() {
            var a = $(this);
            $.ajax({
                url: "AddFriendServlet",
                data: {
                    user_id:  $(this).attr('user-id'),
                    friend_id:  $(this).attr('friend-id'),
                    user_name:  $(this).attr('user-name'),
                    friend_name:  $(this).attr('friend-name'),
                    email:  $(this).attr('email') },
                type: "GET",
                datatype: "txt",
                success: function(data){
                    a.html("Request Sent...");
                    a.attr("disabled", "disabled");
                }
            });
        });
    });
</script>
</body>
</html>
