<%@ page import="model.User" %>
<%@ page import="model.Log" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
    <title>User Activity | GoodStay</title>
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
<%
    List<Log> logs = (List<Log>) request.getAttribute("logs");
    Integer log_size = logs.size();

%>
<div class="container">
    <div>
        <div><h4>Activities</h4></div>
        <div>
            <%
                try {
                } catch (Exception e) {
                }
                if (log_size > 0) {
                    for (Log log: logs) {
                        String user_name = "";
                        try {
                            DBDao dbdao = new DBDao();
                            user_name = dbdao.getUser(logs.get(0).getUser_id()).getUser_name();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
            %>
            <div class="notification">
                <span class="gs-text-md">
                    <b class="gs-color-dgreensea"><%=user_name%></b><%=log.getContent()%>
                </span>
                <a disabled="disabled" class="gs-text-md" style="float: right"><span><%=log.getDate()%></span></a>
            </div>
            <%
                    }
                } else {
            %>
            <span class="gs-text-md">No activity yet.</span>
            <%
                }
            %>
        </div>
    </div>
</div>

<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
</body>
</html>
