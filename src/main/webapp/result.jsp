<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.DBDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Search Result | GoodStay</title>
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
//    Boolean isFemale;
//    Boolean isMale;
//    if (user.getGender().equals("female")) {
//        isFemale = true;
//        isMale = false;
//    } else {
//        isMale = true;
//        isFemale = false;
//    }
    List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container">
    <div>
        <div><h4>Advanced Search form</h4></div>

        <div>
            <form role="form" action="/SearchServlet" method="get" class="">
                <div class="form-group">
                    <strong>Username</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> The user name is the unique identifier.</small>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Search by username"/>
                </div>

                <div class="form-group"><strong>Mobile number</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="mobile" placeholder="Search by mobile number" />
                </div>

                <div class="form-group">
                    <div class="list-text"><strong>Gender</strong></div>
                    <div class="list-input">
                        <label class="radio">
                            <input type="radio" name="gender" value="female" data-toggle="radio">Female
                        </label>
                        <label class="radio">
                            <input type="radio" name="gender" value="male" data-toggle="radio">Male
                        </label>
                    </div>
                </div>

                <div class="form-group"><strong>Date of Birth</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="dob" placeholder="Search by birthday" />
                </div>

                <div style="margin: 15px 0 10px 0;">
                    <button class="btn btn-primary btn-embossed btn-block">Search</button>
                </div>
                <div>
                    <p class="gs-color-dclouds gs-text-md">
                        The search results will be shown below.
                    </p>
                </div>
            </form>
        </div>

        <div><h4>Search Result</h4></div>
        <div>
            <div class="row">
                <%
                    String href;
                    for (User u: users) {
                        if (u.getId().equals(user.getId())) {
                            href = "/ProfileServlet?id=";
                        } else {
                            href = "/FriendProfileServlet?id=";
                        }
                %>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzQ4IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDM0OCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMzQ4IiBoZWlnaHQ9IjIwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzMS4xNzk2ODc1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MjJweDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4zNDh4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
                        <div class="caption">
                            <a role="button" href="<%=href + u.getId().toString()%>" class="btn btn-sm btn-primary btn-block"><%=u.getUser_name()%></a>
                            <p class="gs-text-md">Gender: <%=u.getGender()%></p class="gs-text-md">
                            <p class="gs-text-md">Mobile: <%=u.getMobile()%></p>
                            <p class="gs-text-md">BirthD: <%=u.getDate_of_birth()%></p>
                            <p>
                                <%
                                    Boolean isFriend = null;
                                    try {
                                        isFriend = dbdao.checkFriendship(user.getId(), u.getId());
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                                <a role="button" class="btn btn-sm btn-inverse add-friend" user-id="<%=user.getId()%>" friend-id="<%=u.getId()%>" user-name="<%=user.getUser_name()%>" friend-name="<%=u.getUser_name()%>" email="<%=u.getEmail()%>" class="btn btn-primary btn-embossed btn-block" <% if (isFriend) { %>disabled="disable"><span class="fui-check gs-color-greensea"></span> Friend<% } else { %>><span class="fui-plus gs-color-pink"></span> Add friend<% } %></a>
                                <span style="float: right;"> <small class="gs-color-dsun gs-text-sm"> <%=u.getCreate_date()%></small></span>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.add-friend').click(function() {
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
                    a.html("<span class='fui-check gs-color-pink'></span> Request Sent...");
                    a.attr("disabled", "disabled");
                }
            });
        });
    });
</script>
</body>
</html>
