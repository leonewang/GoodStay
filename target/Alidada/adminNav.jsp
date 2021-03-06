<%@ page import="dao.DBDao" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Notification" %>
<%@ page import="java.sql.SQLException" %>
<%
    User admin = (User) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("signin.jsp");
        return;
    }

    List<Notification> notices = null;
    DBDao dbdao = new DBDao();
    try {
        notices = dbdao.getNotification(0);
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
            <a class="navbar-brand" href="#">GoodStay</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a disabled="disabled">Admin Controller Panel</a></li>
                <li><a href="adminNotification.jsp">Notification<% if (count > 0) { %><span class="navbar-unread"><%=count%></span><% } %></a></li>
            </ul>
            <form class="navbar-form navbar-left" action="/AdminSearchServlet" method="post" role="search">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" id="navbar-input" type="search" name="username" placeholder="Search username">
                        <span class="input-group-btn">
                            <button type="submit" class="btn"><span class="fui-search"></span></button>
                        </span>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img
                        src="images/character/leone.jpg" height="40"
                        width="40" alt="Leone" class="img-circle hidden-xs"><%=admin.getUser_name()%></a>
                    <ul class="dropdown-menu">
                        <li><a href="/LoginServlet?action=logout" class="gs-text-md"><span class="glyphicon fui-power"
                                                                                           aria-hidden="true"></span>Log out</a></li>
                    </ul>
                </li>
                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                        class="visible-xs">Settings<span class="fui-gear"></span></span><span
                        class="visible-sm visible-md visible-lg"><span class="fui-gear"></span></span></a>
                    <ul class="dropdown-menu">
                        <li id="li-dark" class="visible-xs gs-text-md"><a href="#" id="dark"><span class="fui-eye"
                                                                                                   aria-hidden="true"></span>
                            Dark</a></li>
                        <li><a href="#" class="gs-text-md"><span class="fui-question-circle"
                                                                 aria-hidden="true"></span> FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!-- /.navbar-collapse -->
</nav>