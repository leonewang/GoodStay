<%@ page import="model.User" %>
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

<!-- container -->
<div class="gs-container container" style="height: 710px;">
    <div class="gs-content">
        <div class="gs-content-right">
            <h2 style="border: none;" class="visible-xs">
                <span class="fui-clip"></span> Seller's Info
            </h2>

            <div class="gs-seller" style="margin-bottom: 15px;">
                <div class="seller-thumb">
                    <a><img src="images/character/leone.jpg" height="140" width="140"></a>
                </div>
                <div class="seller-info">
                    <div class="name" style="font-size: 1.1em; margin-bottom: 9px;">
                        <a><b>Hey, I'm Leone</b></a>
                    </div>
                    <div class="fans" onselectstart="return false">
                        <small><a id="be-fans"><span class="fui-heart fan"></span> Become a fan</span></a>
                            (<span class="fans-num">23</span> fans)
                        </small>
                    </div>
                    <div><small><b>Joined in July 2018</b></small></div>
                    <div><small><a href="#"><span class="fui-eye"></span> Report this user</a></small></div>
                    <div><small><a href="/EditProfileServlet?id=<%=user.getId()%>" class="btn btn-sm btn-primary">Edit Profile</a></small></div>
                </div>
                <div class="gs-clear"></div>
            </div>

            <div class="cd-item-info">
                <div style="padding-bottom: 5px;">
                    <span class="gs-icon fui fui-info-circle"></span><b>Verified Info</b>
                    <div style="height: 5px;border-bottom-style: solid;border-width: 2px;border-color: #BDC3C7;width: 100%;"></div>
                </div>
                <ul>
                    <li><span class="cd-item-icon fui-user"></span><span class="cd-item-bid">01</span>
                        <small> Leone Wang</small>
                    </li>
                    <li><span class="cd-item-icon fui-mail"></span>
                        <small><b class="cd-item-calendar">wangleone.me@gmail.com</b> (Verified)</small>
                    </li>
                    <li><a href=""><span
                            class="cd-item-icon fui-chat"></span>
                        <small><b class="cd-item-watch">0426475811</b></small>
                    </a>
                        <small>(Verified)</small>
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
                            <li role="presentation"><a id="btn-credit" href="#review" aria-controls="review" role="tab" data-toggle="tab">Reviews & Comments</a></li>
                            <li role="presentation" class="active"><a id="btn-cash" href="#watch" aria-controls="watch" role="tab" data-toggle="tab">Watch list</a></li>
                            <li role="presentation"><a id="btn-post" href="#post" aria-controls="post" role="tab" data-toggle="tab">My posts</a></li>
                            <li role="presentation"><a id="btn-order" href="#order" aria-controls="order" role="tab" data-toggle="tab">My orders</a></li>
                        </ul>
                    </div>
                </div>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane" id="review">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-chat"></span> Reviews & Comments
                            </h2>
                            <div>
                                <ul class="media-list">
                                    <li class="media">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object" src="images/character/blank.jpg" height="65" width="65"></a>
                                        </div>
                                        <div class="media-body">
                                            <div>
                                                <b><a>blank</a></b> We stayed at Gabriel's apartment as a treat for my 30th birthday.
                                                The views are incredible – waking up to a panorama of the city was pretty special – and
                                                the roof terrace with its little pool are wonderful too.
                                            </div>
                                            <div class="media-date">
                                                Feb 19, 2017 09:25:36
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object" src="images/character/betrayal.jpg" height="65" width="65"></a>
                                        </div>
                                        <div class="media-body">
                                            <div>
                                                <b><a>betrayal</a></b> Gabriels flat is absolutely amazing1 Great location with uninterupted
                                                views of Cape Town. I highly reccomend this flat to anyone wanting to stay in Cape Town!
                                            </div>
                                            <div class="media-date">
                                                Jul 12, 2018 23:32:10
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object" src="images/character/bignose.jpg" height="65" width="65"></a>
                                        </div>
                                        <div class="media-body">
                                            <div>
                                                <b><a>bignose</a></b> The windows in this Airbnb make it worth it alone but if that weren't enough
                                                it also includes two incredible decks, a cute neighborhood with a grocery store, restaurants, and
                                                coffee shops and is in walking distance of Table Mountain National Park. Gabriel was an accommodating
                                                and friendly host. We only wish the weather had been warmer when we visited...but then again,
                                                we may never have left this wonderful Airbnb if it was.
                                            </div>
                                            <div class="media-date">
                                                Aug 27, 2018 13:23:42
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                        <!-- /cd-comments -->
                    </div>


                    <div role="tabpanel" class="tab-pane active" id="watch">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-eye"></span> Watch List
                                <div class="toolbar">
                                    <div class="btn-toolbar">
                                        <div class="btn-group">
                                            <a class="btn btn-primary active" href="#fakelink"><span class="fui-heart"></span></a>
                                            <a class="btn btn-primary" href="#fakelink"><span class="fui-time"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </h2>
                            <div>
                                <ul class="media-list">
                                    <li class="media">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object" src="https://a0.muscache.com/im/pictures/61566443/79e8ff67_original.jpg?aki_policy=xx_large" height="105" width="140"></a>
                                        </div>
                                        <div class="media-body">
                                            <div>
                                                <b><a href="">J's APT 2 Bed Rooms + Free Portable Wi-Fi</a></b>
                                                <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b>6</b></span></small>
                                                <p class="structure" style="margin: 0;">
                                                    <small><span class="fui fui-home"></span><b>2 bedrooms</b> <b>4 beds</b> <b>1.5 baths</b></small>
                                                    <br>
                                                    <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$350 / night</span></small>
                                                    <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Apartment</span></small>
                                                    <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Sydney Centre </span></small>
                                                </p>
                                            </div>
                                            <div class="media-date">
                                                Feb 19, 2017 09:25:36<a class="gs-flag" style="display: none; float: right;" href="#"><span class="fui fui-trash"></span> <b>Remove from watchlist</b></a>
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object" src="https://a0.muscache.com/im/pictures/f539b3dd-2210-49a8-9b00-ca134975379f.jpg?aki_policy=xx_large" height="105" width="140"></a>
                                        </div>
                                        <div class="media-body">
                                            <div>
                                                <b><a href="">Shinjuku 3 storied House!100㎡ & 12pax & FREE PARKING</a></b>
                                                <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b>8</b></span></small>
                                                <p class="structure" style="margin: 0;">
                                                    <small><span class="fui fui-home"></span><b>4 bedrooms</b> <b>10 beds</b> <b>2.5 baths</b></small>
                                                    <br>
                                                    <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$290 / night</span></small>
                                                    <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">House</span></small>
                                                    <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Sydney Centre </span></small>
                                                </p>
                                            </div>
                                            <div class="media-date">
                                                Oct 03, 2018 23:236:19<a class="gs-flag" style="display: none; float: right;" href="#"><span class="fui fui-trash"></span> <b>Remove from watchlist</b></a>
                                            </div>
                                            <div class="gs-clear"></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                    </div>

                    <div role="tabpanel" class="tab-pane" id="post">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-image"></span> My Posts
                                <div class="toolbar">
                                    <div class="btn-toolbar">
                                        <div class="btn-group" role="tablist">
                                            <a class="btn btn-primary active" href="#activepost" aria-controls="activepost" role="tab" data-toggle="tab"><span class="fui-star-2"></span> Active</a>
                                            <a class="btn btn-primary" href="#completedpost" aria-controls="completedpost" role="tab" data-toggle="tab"><span class="fui-time"></span> Completed</a>
                                        </div>
                                    </div>
                                </div>
                            </h2>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="activepost">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#"><img class="media-object" src="https://a0.muscache.com/im/pictures/89281220/ed6e8824_original.jpg?aki_policy=large" height="105" width="140"></a>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <b><a href="">Spacious! Shibuya House w/Garden</a></b>
                                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b>1</b></span></small>
                                                    <p class="structure" style="margin: 0;">
                                                        <small><span class="fui fui-home"></span><b>3 bedrooms</b> <b>4 beds</b> <b>2 baths</b></small>
                                                        <br>
                                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$388 / night</span></small>
                                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Unit</span></small>
                                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">South Sydney </span></small>
                                                    </p>
                                                </div>
                                                <div class="media-date">
                                                    Aug 31, 2018 12:32:45<a class="gs-flag" style="display: none; float: right;" href="#"><span class="fui fui-new"></span> <b>Edit the post</b></a>
                                                </div>
                                                <div class="gs-clear"></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div role="tabpanel" class="tab-pane" id="completedpost">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#"><img class="media-object" src="https://a0.muscache.com/im/pictures/66915e3c-0d1f-4708-a8e0-17cfa658a944.jpg?aki_policy=large" height="105" width="140"></a>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <b><a href="">Shinjuku! Free Wi-Fi + Good Location + Clean Room!</a></b>
                                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b>8</b></span></small>
                                                    <p class="structure" style="margin: 0;">
                                                        <small><span class="fui fui-home"></span><b>4 bedrooms</b> <b>10 beds</b> <b>2.5 baths</b></small>
                                                        <br>
                                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$420 / night</span></small>
                                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Apartment</span></small>
                                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Sydney Centre </span></small>
                                                    </p>
                                                </div>
                                                <div class="media-date">
                                                    Oct 03, 2018 23:26:19
                                                    <span class="fui fui-time" style="margin-left: 10px;"></span> <b>2018-08-10 ~ 2018-08-15</b>
                                                    <a class="gs-flag" style="display: none; float: right;" href="#"><span class="fui fui-link"></span> <b>View it!</b></a>
                                                </div>
                                                <div class="gs-clear"></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                    </div>

                    <div role="tabpanel" class="tab-pane" id="order">
                        <div class="cd-comments">
                            <h2>
                                <span class="fui-document"></span> My Orders
                                <div class="toolbar">
                                    <div class="btn-toolbar">
                                        <div class="btn-group" role="tablist">
                                            <a class="btn btn-primary active" href="#activeorder" aria-controls="activeorder" role="tab" data-toggle="tab"><span class="fui-star-2"></span> Active</a>
                                            <a class="btn btn-primary" href="#completedorder" aria-controls="completedorder" role="tab" data-toggle="tab"><span class="fui-time"></span> Completed</a>
                                        </div>
                                    </div>
                                </div>
                            </h2>
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="activeorder">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#"><img class="media-object" src="https://a0.muscache.com/im/pictures/ecec9252-400d-48aa-9422-fd5462ea3c16.jpg?aki_policy=large" height="105" width="140"></a>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <b><a href="">Spacious! Shibuya House w/Garden</a></b>
                                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b>5</b></span></small>
                                                    <p class="structure" style="margin: 0;">
                                                        <small><span class="fui fui-home"></span><b>3 bedrooms</b> <b>4 beds</b> <b>2 baths</b></small>
                                                        <br>
                                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$388 / night</span></small>
                                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Unit</span></small>
                                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">South Sydney </span></small>
                                                    </p>
                                                </div>
                                                <div class="media-date">
                                                    Sep 31, 2018 10:09:17
                                                    <span class="fui fui-time" style="margin-left: 10px;"></span> <b>2018-10-02 ~ 2018-10-08</b>
                                                    <a class="gs-flag" style="display: none; float: right;" href="#"><span class="fui fui-link"></span> <b>View it!</b></a>
                                                </div>
                                                <div class="gs-clear"></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div role="tabpanel" class="tab-pane" id="completedorder">
                                    <ul class="media-list">
                                        <li class="media">
                                            <div class="media-left">
                                                <a href="#"><img class="media-object" src="https://a0.muscache.com/im/pictures/45604883/54451b1c_original.jpg?aki_policy=large" height="105" width="140"></a>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <b><a href="">Stunning home in central Tokyo</a></b>
                                                    <small><span class="fui fui-heart gs-color-pink" style="margin-left: 10px;"> <b>12</b></span></small>
                                                    <p class="structure" style="margin: 0;">
                                                        <small><span class="fui fui-home"></span><b>2 bedrooms</b> <b>2 beds</b> <b>1.5 baths</b></small>
                                                        <br>
                                                        <small><span class="label label-primary">PRICE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">$289 / night</span></small>
                                                        <small><span class="label label-success">TYPE</span><span style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Unit</span></small>
                                                        <small><span class="label label-warning">AREA</span><span class="cd-item-location gs-color-dsun" style="margin: 5px 0;padding: .3em .5em .3em;font-size: 90%;font-weight: bold;line-height: 1;white-space: nowrap;">Other Area </span></small>
                                                    </p>
                                                </div>
                                                <div class="media-date">
                                                    Oct 02, 2018 12:45:31
                                                    <span class="fui fui-time" style="margin-left: 10px;"></span> <b>2017-09-23 ~ 2017-09-29</b>
                                                    <a class="gs-flag" style="display: none; float: right;" href="#"><span class="fui fui-link"></span> <b>View it!</b></a>
                                                </div>
                                                <div class="gs-clear"></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="gs-clear"></div>
                        </div>
                    </div>
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
</script>
</body>
</html>
