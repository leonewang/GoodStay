<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Notification | UNSW BOOK</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <style>
        .notification {
            background-color: #ecf0f5;
            border-radius: 6px;
            position: relative;
            padding: 20px;
            margin: 20px 0;
        }

        .notification:before {
            content: "";
            border-style: solid;
            border-width: 0 9px 9px 9px;
            border-color: transparent transparent #ecf0f5 transparent;
            height: 0px;
            position: absolute;
            left: 23px;
            top: -9px;
            width: 0px;
            -webkit-transform: rotate(360deg);
        }
    </style>
</head>
<body style="padding-top: 70px;">
<!-- /custom navbar -->
<%@include file="adminNav.jsp"%>
<div class="container">
    <div>
        <div><h4>Notifications</h4></div>
        <div>
            <%
                if (count > 0) {
                    for (Notification notice: notices) {
            %>
            <div class="notification">
                <span class="gs-text-md">
                    <a><b><%=dbdao.getUser(notice.getSend_from()).getUser_name()%></b></a><%=notice.getContent()%>
                </span>
                <button class="btn btn-sm btn-primary mark-read" notice-id="<%=notice.getId()%>" style="float: right">Mark as read</button>
            </div>
            <%
                    }
                } else {
            %>
            <span class="gs-text-md">No notification yet.</span>
            <%
                }
            %>
        </div>
    </div>
</div>

<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.mark-read').click(function() {
            var a = $(this);
            $.ajax({
                url: "MarkReadServlet",
                data: { id:  $(this).attr('notice-id')},
                type: "GET",
                datatype: "txt",
                success: function(data){
                    a.html("Read");
                    a.attr("disabled", "disabled");
                }
            });
        });
    });
</script>
</body>
</html>
