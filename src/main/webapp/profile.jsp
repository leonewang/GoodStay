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
                    </li>
                </ul>
            </div>
        </div>

        <div class="gs-content-left" style="padding: 0 0 0 15px">
            <div>
                <div id="list-nav">
                    <div class="list-nav list-input">
                        <!-- Nav tabs -->
                        <ul class="nav nav-pills btn nav-justified" role="tablist">
                            <li role="presentation" class="active"><a id="btn-credit" href="#review" aria-controls="review" role="tab" data-toggle="tab">Reviews & Comments</a></li>
                            <%
                                if (sameUser) {
                            %>
                            <li role="presentation"><a id="btn-cash" href="#watch" aria-controls="watch" role="tab" data-toggle="tab">Watch list</a></li>
                            <li role="presentation"><a id="btn-post" href="#post" aria-controls="post" role="tab" data-toggle="tab">My posts</a></li>
                            <li role="presentation"><a id="btn-order" href="#booking" aria-controls="booking" role="tab" data-toggle="tab">My bookings</a></li>
                            <%
                                } else {
                            %>
                            <li role="presentation"><a id="btn-post" href="#post" aria-controls="post" role="tab" data-toggle="tab">Current posts</a></li>
                            <%
                            }
                            %>
                        </ul>
                    </div>
                </div>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="review">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-chat"></span> Reviews & Comments
                            </h2>
                            <div>
                                <ul class="media-list">
                                    <%
                                        List<Review> reviews = dbdao.getUserReviews(u.getId());

                                        if (reviews.size() > 0) {
                                            for (int i = 0; i < reviews.size(); i++) {
                                                Review review = reviews.get(i);
                                    %>
                                    <li class="media">
                                        <div class="media-left">
                                            <a href="profile.jsp?user_id=<%=review.getUser_id()%>"><img class="media-object" src="images/character/leone.jpg" height="65" width="65"></a>
                                        </div>
                                        <div class="media-body">
                                            <div>
                                                <b><a href="profile.jsp?user_id=<%=review.getUser_id()%>"><%=review.getUser_name()%></a></b> <%=review.getContent()%>
                                            </div>
                                            <div class="media-date">
                                                <%=new java.text.SimpleDateFormat("EEE, MMM dd, yyyy HH:mm:ss", Locale.US).format(review.getDate().getTime())%>
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <small>You don't have any review yet.</small>
                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                        <!-- /cd-comments -->
                    </div>

                    <%
                        if (sameUser) {
                    %>
                    <div role="tabpanel" class="tab-pane" id="watch">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-eye"></span> Watch List
                            </h2>
                            <div>
                                <ul class="media-list">
                                    <%
                                        List<Post> watches = new ArrayList<Post>();
                                        List<Integer> watchlist_ids = new ArrayList<Integer>();
                                        watches = dbdao.getWatchlist(u.getId());
                                        watchlist_ids = dbdao.getWatchlistID(u.getId());

                                        if (watches.size() > 0) {
                                            for (int i = 0; i < watches.size(); i++) {
                                                Post watch = watches.get(i);
                                                int watchlist_id = watchlist_ids.get(i);
                                                Image image = dbdao.findImage(watch.getId());
                                    %>
                                    <li class="media">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object" src="<%=image.getContent()%>" height="105" width="140"></a>
                                        </div>
                                        <div class="media-body">
                                            <div>
                                                <b><a href="DetailServlet?id=<%=watch.getId()%>"><%=watch.getTitle()%></a></b>
                                                <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b><%=watch.getLikes()%></b></span></small>
                                                <p class="structure" style="margin: 0;">
                                                    <small><span class="fui fui-home"></span>
                                                        <%
                                                            String demand[] = watch.getDemands().split(",");
                                                            for(int j = 0; j < demand.length; j++){
                                                        %>
                                                        <b><%=demand[j]%></b>
                                                        <%
                                                            }
                                                        %>
                                                    </small>
                                                    <br>
                                                    <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$<%=watch.getPrice()%> / night</span></small>
                                                    <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=watch.getType()%></span></small>
                                                    <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=watch.getCity()%> </span></small>
                                                </p>
                                            </div>
                                            <div class="media-date">
                                                <%=new java.text.SimpleDateFormat("EEE, MMM dd, yyyy HH:mm:ss", Locale.US).format(watch.getPost_date().getTime())%>
                                                <a class="gs-flag" style="display: none; float: right;" onclick="remove_watchlist(<%=watchlist_id%>, '<%=watch.getId()%>');">
                                                <span class="fui fui-trash"></span> <b>Remove from watchlist</b></a>
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                    <%
                                            }
                                        } else {
                                    %>
                                    <small>You don't have anything in your watchlist. Just start to browse.</small>
                                    <%
                                        }
                                    %>

                                </ul>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                    </div>
                    <%
                        }
                    %>

                    <div role="tabpanel" class="tab-pane" id="post">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-image"></span>
                                <%
                                    if (sameUser) {
                                %> My Posts
                                <%
                                    } else {
                                %> Current Posts
                                <%
                                    }
                                %>
                            </h2>
                            <div>
                                <ul class="media-list">
                                    <%
                                        List<Post> posts = new ArrayList<Post>();
                                        posts = dbdao.getMyActivePosts(u.getId());

                                        if (posts.size() > 0) {
                                            for (int i = 0; i < posts.size(); i++) {
                                                Post post = posts.get(i);
                                                Image image = dbdao.findImage(post.getId());
                                    %>
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
                                                <a class="gs-flag" style="display: none; float: right;" href="editPost.jsp?post_id=<%=post.getId()%>">
                                                <%
                                                    if (sameUser) {
                                                %>
                                                    <span class="fui fui-new"></span><b> Edit the post</b></a>
                                                <%
                                                    }
                                                %>
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                    <%
                                            }
                                        } else {
                                    %>
                                    <small>You don't have anything in your posts. Just start a post.</small>
                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                    </div>

                    <%
                        if (sameUser) {
                    %>
                    <div role="tabpanel" class="tab-pane" id="booking">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-document"></span> My Bookings
                                <div class="toolbar">
                                    <div class="btn-toolbar">
                                        <div class="btn-group" role="tablist">
                                            <a class="btn btn-primary active" href="#activebooking" aria-controls="activebooking" role="tab" data-toggle="tab"><span class="fui-star-2"></span> Active</a>
                                            <a class="btn btn-primary" href="#waitingbooking" aria-controls="waitingbooking" role="tab" data-toggle="tab"><span class="fui-time"></span> Waiting</a>
                                            <a class="btn btn-primary" href="#completedbooking" aria-controls="completedbooking" role="tab" data-toggle="tab"><span class="fui-document"></span> Completed</a>
                                        </div>
                                    </div>
                                </div>
                            </h2>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="activebooking">
                                    <ul class="media-list">
                                        <%
                                            List<Post> a_bookings = new ArrayList<Post>();
                                            List<Booking> a_bookingsInfo = new ArrayList<Booking>();
                                            a_bookings = dbdao.getMyActiveBookings(u.getId());
                                            a_bookingsInfo = dbdao.getMyActiveBookingsInfo(u.getId());

                                            if (a_bookings.size() > 0) {
                                                for (int i = 0; i < a_bookings.size(); i++) {
                                                    Post a_booking = a_bookings.get(i);
                                                    Booking a_bookingInfo = a_bookingsInfo.get(i);
                                                    Image image = dbdao.findImage(a_booking.getId());
                                        %>
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#"><img class="media-object" src="<%=image.getContent()%>" height="105" width="140"></a>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <b><a href="DetailServlet?id=<%=a_booking.getId()%>"><%=a_booking.getTitle()%></a></b>
                                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b><%=a_booking.getLikes()%></b></span></small>
                                                    <p class="structure" style="margin: 0;">
                                                        <small><span class="fui fui-home"></span>
                                                            <%
                                                                String demand[] = a_booking.getDemands().split(",");
                                                                for(int j = 0; j < demand.length; j++){
                                                            %>
                                                            <b><%=demand[j]%></b>
                                                            <%
                                                                }
                                                            %>
                                                        </small>
                                                        <br>
                                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$<%=a_booking.getPrice()%> / night</span></small>
                                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=a_booking.getType()%></span></small>
                                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=a_booking.getCity()%> </span></small>
                                                        <small><span class="cd-item-location" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><a href="review.jsp?post_id=<%=a_booking.getId()%>&user_id=<%=u.getId()%>&booking_id=<%=a_bookingInfo.getId()%>"><span class="fui-new"></span> Write a review</a></span></small>
                                                    </p>
                                                </div>
                                                <div class="media-date">
                                                    <%=new java.text.SimpleDateFormat("EEE, MMM dd, yyyy HH:mm:ss", Locale.US).format(a_booking.getPost_date().getTime())%>
                                                    <span class="fui fui-time" style="margin-left: 10px;"></span> <b><%=a_bookingInfo.getStart_date()%> ~ <%=a_bookingInfo.getEnd_date()%></b>
                                                    <a class="gs-flag cancel-booking" style="display: none; float: right;" user-id="<%=u.getId()%>" post-by="<%=a_booking.getPost_by()%>" book-id="<%=a_bookingInfo.getId()%>"><span class="fui fui-trash"></span> <b>Cancel</b></a>
                                                </div>
                                                <div class="gs-clear"></div>
                                            </div>
                                        </li>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <small>You don't have anything in your active list. Just go browsing.</small>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>

                                <div role="tabpanel" class="tab-pane" id="waitingbooking">
                                    <ul class="media-list">
                                        <%
                                            List<Post> w_bookings = new ArrayList<Post>();
                                            List<Booking> w_bookingsInfo = new ArrayList<Booking>();
                                            w_bookings = dbdao.getMyWaitingBookings(u.getId());
                                            w_bookingsInfo = dbdao.getMyWaitingBookingsInfo(u.getId());

                                            if (w_bookings.size() > 0) {
                                                for (int i = 0; i < w_bookings.size(); i++) {
                                                    Post w_booking = w_bookings.get(i);
                                                    Booking w_bookingInfo = w_bookingsInfo.get(i);
                                                    Image image = dbdao.findImage(w_booking.getId());
                                        %>
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#"><img class="media-object" src="<%=image.getContent()%>" height="105" width="140"></a>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <b><a href="DetailServlet?id=<%=w_bookingInfo.getId()%>"><%=w_booking.getTitle()%></a></b>
                                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b><%=w_booking.getLikes()%></b></span></small>
                                                    <p class="structure" style="margin: 0;">
                                                        <small><span class="fui fui-home"></span>
                                                            <%
                                                                String demand[] = w_booking.getDemands().split(",");
                                                                for(int j = 0; j < demand.length; j++){
                                                            %>
                                                            <b><%=demand[j]%></b>
                                                            <%
                                                                }
                                                            %>
                                                        </small>
                                                        <br>
                                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$<%=w_booking.getPrice()%> / night</span></small>
                                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=w_booking.getType()%></span></small>
                                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=w_booking.getCity()%> </span></small>
                                                    </p>
                                                </div>
                                                <div class="media-date">
                                                    <%=new java.text.SimpleDateFormat("EEE, MMM dd, yyyy HH:mm:ss", Locale.US).format(w_booking.getPost_date().getTime())%>
                                                    <span class="fui fui-time" style="margin-left: 10px;"></span> <b><%=w_bookingInfo.getStart_date()%> ~ <%=w_bookingInfo.getEnd_date()%></b>
                                                </div>
                                                <div class="gs-clear"></div>
                                            </div>
                                        </li>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <small>You don't have anything in your waiting list. Just go browsing.</small>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>

                                <div role="tabpanel" class="tab-pane" id="completedbooking">
                                    <ul class="media-list">
                                        <%
                                            List<Post> c_bookings = new ArrayList<Post>();
                                            List<Booking> c_bookingsInfo = new ArrayList<Booking>();
                                            c_bookings = dbdao.getMyCompletedBookings(u.getId());
                                            c_bookingsInfo = dbdao.getMyCompletedBookingsInfo(u.getId());

                                            if (c_bookings.size() > 0) {
                                                for (int i = 0; i < c_bookings.size(); i++) {
                                                    Post c_booking = c_bookings.get(i);
                                                    Booking c_bookingInfo = c_bookingsInfo.get(i);
                                                    Image image = dbdao.findImage(c_booking.getId());
                                        %>
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#"><img class="media-object" src="<%=image.getContent()%>" height="105" width="140"></a>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <b><a href="DetailServlet?id=<%=c_bookingInfo.getId()%>"><%=c_booking.getTitle()%></a></b>
                                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b><%=c_booking.getLikes()%></b></span></small>
                                                    <p class="structure" style="margin: 0;">
                                                        <small><span class="fui fui-home"></span>
                                                            <%
                                                                String demand[] = c_booking.getDemands().split(",");
                                                                for(int j = 0; j < demand.length; j++){
                                                            %>
                                                            <b><%=demand[j]%></b>
                                                            <%
                                                                }
                                                            %>
                                                        </small>
                                                        <br>
                                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$<%=c_booking.getPrice()%> / night</span></small>
                                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=c_booking.getType()%></span></small>
                                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;"><%=c_booking.getCity()%> </span></small>
                                                    </p>
                                                </div>
                                                <div class="media-date">
                                                    <%=new java.text.SimpleDateFormat("EEE, MMM dd, yyyy HH:mm:ss", Locale.US).format(c_booking.getPost_date().getTime())%>
                                                    <span class="fui fui-time" style="margin-left: 10px;"></span> <b><%=c_bookingInfo.getStart_date()%> ~ <%=c_bookingInfo.getEnd_date()%></b>
                                                </div>
                                                <div class="gs-clear"></div>
                                            </div>
                                        </li>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <small>You don't have anything in your completed list. Just go browsing.</small>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
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

    $('.cancel-booking').click(function() {
        cancel_booking(this);
    });

    function cancel_booking(node) {
        swal({
            title: "Are you sure?",
            text: "Are you sure that you want to delete the booking?",
            html: true,
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "Confirm",
            confirmButtonColor: "#E74C3C"
        }, function () {
            $.ajax({
                url: "CancelBookingServlet",
                type: "GET",
                dataType: "html",
                data: {
                    sendto: $(node).attr("post-by"),
                    sendfrom: $(node).attr("user-id"),
                    bookingid: $(node).attr("book-id")
                }
            })
                .done(function (data) {
                    swal("Success!", "You have canceled the booking already.", "success");
                    $(node).attr("hidden", "hidden");
                })
                .error(function (data) {
                    swal("Sorry!", "Something wrong.", "error");
                });
        })
    };
</script>
</body>
</html>
