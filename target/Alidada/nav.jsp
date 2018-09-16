<%@ page import="dao.DBDao" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Notification" %>
<%@ page import="java.sql.SQLException" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("signin.jsp");
        return;
    }

    DBDao dbdao = new DBDao();
    List<Notification> notices = null;
    try {
        notices = dbdao.getNotification(user.getId());
    } catch (SQLException e) {
        e.printStackTrace();
    }
    Integer count = notices.size();
%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
            </button>
            <a class="navbar-brand" href="wall.jsp">GoodStay</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="post.jsp">Post</a></li>
                <li><a href="wall.jsp">Browse</a></li>
                <li><a href="/SearchGraphServlet?username=">Help</a></li>
                <li><a href="notification.jsp">Notification<% if (count > 0) { %><span class="navbar-unread"><%=count%></span><% } %></a></li>
            </ul>
            <form class="navbar-form navbar-left" action="/SearchServlet" method="post" role="search">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" id="navbar-input" type="search" name="username" placeholder="Search">
                        <span class="input-group-btn">
                            <button type="submit" class="btn"><span class="fui-search"></span></button>
                        </span>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img
                        src="images/character/leone.jpg" height="40"
                        width="40" alt="Leone" class="img-circle hidden-xs"><%=user.getUser_name()%> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/ProfileServlet?id=<%=user.getId()%>" class="gs-text-md"><span class="glyphicon fui-user"
                                                                 aria-hidden="true"></span>Profile</a></li>
                        <li><a href="#" class="gs-text-md"><span class="glyphicon fui-document"
                                                                 aria-hidden="true"></span>Friends</a></li>
                        <li class="divider"></li>
                        <li><a href="/LoginServlet?action=logout" class="gs-text-md"><span class="glyphicon fui-power"
                                                                 aria-hidden="true"></span>Log out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!-- /.navbar-collapse -->
</nav>