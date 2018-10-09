<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %>
<%@ page import="javafx.geometry.Pos" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Locale" %>
<%@ page import="model.*" %>
<%@ page import="java.awt.print.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Profile | GoodStay</title>
    <!-- Loading Bootstrap -->
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/vendor/dropzone.css">
    <link rel="stylesheet" href="css/assets/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/vendor/sweetalert.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/cd-doc.css">
    <link rel="stylesheet" href="css/dropzone.custom.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <script src="js/vendor/modernizr.js"></script>
    <style>
        .structure b {
            margin-left: 7px;
        }
    </style>
</head>
<body style="padding-top: 70px;">
<!-- /custom navbar -->
<%@include file="nav.jsp"%>
<%
    User u = dbdao.getUser(Integer.valueOf(request.getParameter("user_id")));
    Post post = dbdao.getPostDetail(request.getParameter("post_id"));
    int booking_id = Integer.valueOf(request.getParameter("booking_id"));
    Image image = dbdao.findImage(request.getParameter("post_id"));

    Boolean sameUser = false;
    if (u.getUser_name().equals(user.getUser_name())) {
        sameUser = true;
    }
%>

<!-- container -->
<div class="gs-container container" style="min-height: 710px;">
    <div class="gs-content">
        <div class="gs-content-right">
            <h2 style="border: none;" class="visible-xs">
                <span class="fui-clip"></span> Info
            </h2>

            <p class="cd-title">Welcome, I'm <%=u.getName()%>.</p>


            <div class="gs-seller" style="margin-bottom: 15px;">
                <div class="seller-thumb">
                    <a><img src="images/character/leone.jpg" height="115" width="115"></a>
                </div>
                <div class="seller-info">
                    <div class="name" style="font-size: 1.1em; margin-bottom: 9px;">
                        <a href="#"><b><%=u.getUser_name()%></b></a>
                    </div>
                    <div><small><b>Joined in July 2018</b></small></div>
                    <div><small><a href="#"><span class="fui-eye"></span> Report this user</a></small></div>
                    <%
                        if (sameUser) {
                    %>
                    <div><small><a href="/EditProfileServlet?id=<%=user.getId()%>" class="btn btn-sm btn-primary">Edit Profile</a></small></div>
                    <%  }  else { %>
                    <div><small><a href="/ContactServlet?send_id=<%=user.getId()%>&rec_id=<%=u.getId()%>" class="btn btn-sm btn-primary">Contact</a></small></div>
                    <%
                        }
                    %>
                </div>
                <div class="gs-clear"></div>
            </div>

            <div class="cd-item-info">
                <div style="padding-bottom: 5px;">
                    <span class="gs-icon fui fui-info-circle"></span><b>Verified Info</b>
                    <div style="height: 5px;border-bottom-style: solid;border-width: 2px;border-color: #BDC3C7;width: 100%;"></div>
                </div>
                <ul>
                    <li><span class="cd-item-icon fui-user"></span><span class="cd-item-bid"><%=u.getId()%></span>
                        <small> Unique ID</small>
                    </li>
                    <li><span class="cd-item-icon fui-mail"></span>
                        <small><b class="cd-item-calendar"><%=u.getEmail()%></b> (Verified)</small>
                    </li>
                    <li><a href=""><span
                            class="cd-item-icon fui-chat"></span>
                        <small><b class="cd-item-watch"><%=u.getMobile()%></b></small>
                    </a>
                        <small>(Verified)</small>
                    </li>
                </ul>
            </div>
        </div>

        <div class="gs-content-left" style="padding: 0 0 0 15px">
            <div class="cd-comments">
                <h2 style="padding: 1em 0 10px 0;">
                    <span class="fui-chat"></span> Write a review
                </h2>
                <div>
                    <ul class="media-list">
                        <li class="media">
                            <div class="media-left">
                                <a href="#"><img class="media-object" src="<%=image.getContent()%>" height="105" width="140"></a>
                            </div>
                            <div class="media-body">
                                <div>
                                    <b><a href="DetailServlet?id=<%=post.getId()%>"><%=post.getTitle()%></a></b>
                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b><%=post.getLikes()%></b></span></small>
                                    <p class="structure" style="margin: 0;">
                                        <small><span class="fui fui-home"></span>
                                            <%
                                                String demand[] = post.getDemands().split(",");
                                                for(int j = 0; j < demand.length; j++){
                                            %>
                                            <b><%=demand[j]%></b>
                                            <%
                                                }
                                            %>
                                        </small>
                                        <br>
                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$<%=post.getPrice()%> / night</span></small>
                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=post.getType()%></span></small>
                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=post.getCity()%> </span></small>
                                    </p>
                                </div>
                                <div class="media-date">
                                    <%=new java.text.SimpleDateFormat("EEE, MMM dd, yyyy HH:mm:ss", Locale.US).format(post.getPost_date().getTime())%>
                                </div>
                                <div class="gs-clear"></div>
                            </div>
                        </li>
                    </ul>
                    <div class="gs-clear"></div>
                </div>
                <div style="margin: 15px 0;">
                    <textarea class="form-control" rows="5" id="review" placeholder="Within 1000 characters ..."></textarea>
                </div>
                <div><button id="post-review" class="btn btn-primary btn-block btn-embossed" post-id="<%=post.getId()%>" post-by="<%=post.getPost_by()%>" user-id="<%=u.getId()%>" user-name="<%=u.getName()%>" booking-id="<%=booking_id%>">Post review</button></div>
                <div class="gs-clear"></div>
            </div>
        </div>
    </div>
</div>
<!-- /container -->

<!-- /custom footer -->
<%@include file="footer.jsp"%>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/assets/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/assets/flat-ui.js"></script>
<!-- To enable mobile swipe -->
<script src="js/assets/jquery.mobile.min.js"></script>
<script src="js/assets/application.js"></script>
<script src="js/vendor/imagesloaded.pkgd.js"></script>
<script src="js/vendor/velocity.min.js"></script>
<script src="js/vendor/image-gallery.js"></script>
<script src="js/vendor/sweetalert-dev.js"></script>
<script src="js/vendor/dropzone.js"></script>
<script src="js/assets/bootstrap-datepicker.min.js"></script>
<!-- Custom jquery sentences -->
<script src="js/backtop.js"></script>
<script src="js/goto-stuff.js"></script>
<script src="js/alert.js"></script>
<script src="js/dropzone.custom.js"></script>
<script src="js/formCheck.js"></script>
<!-- <script src="js/deleteUpload.js"></script> -->
<script>
    $(document).ready(function() {
        $('#check-in').datepicker({
            format: "yyyy-mm-dd"
        });
        $('#check-out').datepicker({
            format: "yyyy-mm-dd"
        });
    });

    $('#post-review').click(function() {
        post_review(this);
    });

    function post_review(node) {
        swal({
            title: "Post a review?",
            html: true,
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "Confirm",
            confirmButtonColor: "#1ABC9C"
        }, function () {
            $.ajax({
                url: "PostReviewServlet",
                type: "GET",
                dataType: "html",
                data: {
                    post_id: $(node).attr("post-id"),
                    post_by: $(node).attr("post-by"),
                    user_id: $(node).attr("user-id"),
                    user_name: $(node).attr("user-name"),
                    booking_id: $(node).attr("booking-id"),
                    content: $("#review").val()
                }
            })
                .done(function (data) {
                    swal("Review posted", "Now this booking has been completed, you can see it in the completed list later.", "success");
                    $(node).attr("disabled", "disabled");
                })
                .error(function (data) {
                    swal("Sorry!", "Something wrong.", "error");
                });
        })
    };
</script>
</body>
</html>
