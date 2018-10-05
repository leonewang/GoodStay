<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="dao.DBDao" %>
<%@ page import="java.util.Locale" %>
<%@ page import="model.Image" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Wall | GoodStay</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/index.css">
    <!-- CSS reset -->
    <link rel="stylesheet" href="css/reset.css">
    <!-- Resource style -->
    <link rel="stylesheet" href="css/cd-style.css">
    <link rel="stylesheet" href="css/vendor/sweetalert.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <style>
        /*.first-row {
                min-height: 1000px;
            }
            */
        .gs-right {
            margin-top: -10px;
            padding-left: 0;
        }
        #new-saved-search>div>div {
            padding: 5px 0;
        }
        .radio input[type="radio"].custom-radio:checked + .icons .icon-checked {
            color: #F39C12;
            filter: none;
            opacity: 1;
            -webkit-filter: none;
        }
        .datepicker-days {
            min-width: 200px;
        }
    </style>
</head>
<body style="padding-top: 70px;">
<!-- /custom navbar -->
<%@include file="nav.jsp"%>
<%
    List<Post> posts = new DBDao().listAllPosts();
    Integer post_num = posts.size();
%>

<div class="container">
    <div class="col-xs-12 gs-right">
        <!-- Pills Tab -->
        <dixv class="row first-row" role="tabpanel">
            <div class="gs-sort">
                <span class="gs-sort-content">Find your good stay</span>
                <a id="save-search" href="#" onclick="jQuery('#flash-saved-search').show();">
                    <small>advance search</small>
                </a>
            </div>
            <div class="select-list-type">
                <select id="select-list" class="form-control select select-primary select-block" style="min-width:150px;">
                    <option value="0">Top Popularity</option>
                    <option value="1">Latest List</option>
                    <option value="2">Lowest Price</option>
                    <option value="3">Highest Price</option>
                </select>
            </div>
            <div class="gs-clear"></div>

            <!-- search -->
            <div id="flash-saved-search" class="alert alert-warning" role="alert" style="display:none;">
                <form id="new-saved-search" accept-charset="UTF-8" action="/advance-search" method="post">
                    <div class="gs-alert-input" style="padding-top:2px;">
                        <div>
                            <label style="padding-top:3px;">Price</label>
                        </div>
                        <div class="has-warning">
                            <input class="form-control" placeholder="Min: $" style="width: 75px">
                        </div>
                        <div class="has-warning">
                            <input class="form-control" placeholder="Max: $" style="width: 75px">
                        </div>
                        <div>
                            <label style="padding-top:3px;">Structure</label>
                        </div>
                        <div class="list-input">
                            <select data-toggle="select" multiple class="form-control multiselect multiselect-warning" name="typeId" style="width: 300px;">
                                <optgroup label="Bedroom">
                                    <option value="1">1 Bed</option>
                                    <option value="2">2 Beds</option>
                                    <option value="3">3 Beds</option>
                                    <option value="4">More than 3 Beds</option>
                                </optgroup>
                                <optgroup label="Bathroom">
                                    <option value="5" selected>1 Bathroom</option>
                                    <option value="6">2 Bathrooms</option>
                                    <option value="7">3 Bathrooms</option>
                                    <option value="8">More than 3 Bathrooms</option>
                                </optgroup>
                            </select>
                        </div>
                        <div>
                            <label style="padding-top:3px;">Parking</label>
                        </div>
                        <div class="list-input has-warning">
                            <label class="radio has-warning" style="float: left;">
                                <input type="radio" name="parking" id="list-radio-true" value="true" data-toggle="radio">
                                Yes &nbsp;&nbsp;&nbsp;
                            </label>
                            <label class="radio has-warning" style="float: left;">
                                <input type="radio" name="parking" id="list-radio-true" value="false" data-toggle="radio" checked="">
                                No matter
                            </label>
                        </div>
                        <div>
                            <label style="padding-top:3px;">Check in</label>
                        </div>
                        <div class="has-warning">
                            <input id='checkindate' name="checkintime" class="form-control" placeholder="yyyy-mm-dd" style="width: 110px">
                        </div>
                        <div>
                            <label style="padding-top:3px;">Check out</label>
                        </div>
                        <div class="has-warning">
                            <input id='checkoutdate' name="checkouttime" class="form-control" placeholder="yyyy-mm-dd" style="width: 110px">
                        </div>
                        <div>
                            <label style="padding-top:3px;">Dwelling Type</label>
                        </div>
                        <div class="list-input">
                            <select data-toggle="select" class="form-control select select-warning" name="type" style="min-width: 150px; width: 175px;">
                                <option value="1">Apartment & Unit</option>
                                <option value="2">House</option>
                                <option value="3">Townhouse & Villa</option>
                                <option value="4">Others</option>
                            </select>
                        </div>
                        <div>
                            <button class="btn btn-warning warning-save">Search</button>
                        </div>
                        <div style="font-size:14px;padding-top:13px;">
                            <a href="#" class="alert-cancel alert-link" onclick="jQuery('#flash-saved-search').hide();">Cancel</a>
                        </div>
                    </div>
                </form>
                <div class="gs-clear"></div>
            </div>
            <!-- /custom search -->

            <!-- info alert -->
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <span class="gs-alert-icon fui-info-circle"></span>Earn credits by
                <strong><a class="alert-link" href="#">making a deal</a></strong>,
                <strong><a class="alert-link" href="#">inviting friends</a></strong>, or
                <strong><a class="alert-link" href="#">get it instantly in here.</a></strong>
            </div>

            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="random">
                    <%
                        if(post_num > 0) {
                    %>
                    <div class="row masonry-container">
                        <%
                            String href;
                            for (Post post: posts) {
                                if (post.getPost_by().equals(user.getId())) {
                                    href = "/ProfileServlet?id=";
                                } else {
                                    href = "/FriendProfileServlet?id=";
                                }
                                Image image = new DBDao().findImage(post.getId());
                        %>
                        <a href="/DetailServlet?id=<%=post.getId()%>">
                            <div class="col-xs-12 col-sm-6 col-md-4 item">
                                <div class="tile">
                                    <img src="images/icons/svg/ribbon-popular.svg" alt="ribbon" class="tile-hot-ribbon">
                                    <img alt="100%x200" src="<%=image.getContent()%>" style="height: 200px; width: 100%; display: block;">
                                    <a role="button" disabled="disabled" class="btn btn-sm btn-primary btn-block"
                                       style="margin-top: 10px; background-color: #95A5A6; color: #fff;">
                                        <%
                                            String demand[] = post.getDemands().split(",");
                                            String demands = "";
                                            for(int i = 0; i < demand.length; i++){
                                                demands += demand[i] + " - ";
                                            }
                                        %>
                                        <b><%=demands.substring(0,demands.length()-3)%></b>
                                    </a>
                                    <p><%=post.getTitle()%></p>
                                    <span class="label label-warning gs-bid">PRICE</span>
                                    <small class="gs-bid-num">$<%=post.getPrice()%> / night </small>
                                    <small class="gs-days"><%=new java.text.SimpleDateFormat("yyyy/MM/dd", Locale.US).format(post.getPost_date())%></small>
                                    <div class="gs-clear"></div>
                                    <span class="label label-success gs-gin">TYPE</span>
                                    <small class="gs-gin-num"><%=post.getType()%></small>
                                    <small class="gs-location"><%=post.getCity()%></small>
                                    <div class="gs-clear"></div>
                                </div>
                            </div>
                        </a>
                        <%
                            }
                        } else {
                        %>
                        <div>
                            No listing yet.
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <!-- Pills Tab -->

            <div class="row text-center">
                <div class="pagination pagination-minimal hidden-xs">
                    <ul>
                        <li class="previous"><a href="#" class="fui-arrow-left"></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li class="next"><a href="#" class="fui-arrow-right"></a></li>
                    </ul>
                </div>

                <ul class="pagination-plain visible-xs">
                    <li class="previous"><a href="#">← Previous</a></li>
                    <li class="next"><a href="#">Newer →</a></li>
                    <div class="gs-clear"></div>
                </ul>

            </div>
        </dixv>
    </div>
</div>


    <!-- /custom footbar -->
<%@include file="footer.jsp"%>

<script src="js/assets/jquery.min.js"></script>
<script src="js/vendor/imagesloaded.pkgd.js"></script>
<!-- Modernizr -->
<script src="js/vendor/modernizr.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script src="js/vendor/masonry.pkgd.js"></script>
<script src="js/vendor/velocity.min.js"></script>
<script src="js/vendor/sweetalert-dev.js"></script>
<script src="js/assets/bootstrap-datepicker.min.js"></script>

<!-- Custom jquery sentences -->
<script src="js/backtop.js"></script>
<script src="js/goto-stuff.js"></script>
<script src="js/alert.js"></script>
<script>
    $('#select-list').select2({});
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#checkindate').datepicker({
            format: "yyyy-mm-dd"
        });
        $('#checkoutdate').datepicker({
            format: "yyyy-mm-dd"
        });
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
