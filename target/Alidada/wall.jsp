<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="dao.DBDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Wall | UNSW BOOK</title>
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
    List<Post> posts = new DBDao().listAllPosts(user.getId());
    Integer post_num = posts.size();
%>
<div class="container">
    <div>
        <div><h4>Moment Wall</h4></div>
        <div>
            <%
                if(post_num > 0) {
            %>

            <div class="row">
                <%
                    String href;
                    for (Post post: posts) {
                        if (post.getPost_by().equals(user.getId())) {
                            href = "/ProfileServlet?id=";
                        } else {
                            href = "/FriendProfileServlet?id=";
                        }
                %>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzQ4IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDM0OCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMzQ4IiBoZWlnaHQ9IjIwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzMS4xNzk2ODc1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MjJweDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4zNDh4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
                        <div class="caption">
                            <a role="button" href="<%=href + post.getPost_by().toString()%>" class="btn btn-sm btn-primary btn-block"><%=post.getPoster()%></a>
                            <p><%=post.getText()%></p>
                            <p class="gs-text-sm"><a href="<%=post.getUrl()%>"><%=post.getUrl()%></a></p>
                            <p>
                                <a role="button" class="btn btn-sm btn-inverse like" like="<%=post.getId()%>" send-to="<%=post.getPost_by()%>" send-from="<%=user.getId()%>"><%=post.getLikes()%>&nbsp;&nbsp;<span class="fui-heart gs-color-pink"></span></a>
                                <span style="float: right;"> <small class="gs-color-dsun gs-text-sm"> <%=post.getPost_date()%></small></span>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div>
                    No moment yet.
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
        $('.like').click(function() {
            var a = $(this);
            $.ajax({
                url: "LikeServlet",
                data: {
                    id:  $(this).attr('like'),
                    send_to: $(this).attr('send-to'),
                    send_from: $(this).attr('send-from')
                },
                type: "GET",
                datatype: "txt",
                success: function(data){
                    a.html("Liked");
                }
            });
        });
    });
</script>
</body>
</html>
