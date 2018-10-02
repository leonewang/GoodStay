<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Details | GoodStay</title>
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
        .list-unlock {
            font-size: 0.9em;
            margin: -5px 0 15px 27%;
            padding: 10px 20px;
            width: 65%;
            background-color: #ECF0F1;
            border-radius: 3px;
        }
    </style>
</head>
<body style="padding-top: 70px;">
<!-- /custom navbar -->
<%@include file="nav.jsp"%>

<!-- container -->
<div class="gs-container container">
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

    <div>
        <p class="cd-title">Mouzinho 134 - Hist Center - Orange</p>
    </div>

    <div class="gs-content">
        <div class="gs-content-left">
            <section class="cd-single-item cd-slider-active">
                <div class="cd-slider-wrapper">
                    <ul class="cd-slider">
                        <li class="selected"><img src="https://z1.muscache.cn/im/pictures/7c85b432-33fe-4ebd-8abf-dad0576183fc.jpg?aki_policy=xx_large" alt="Product Image 1"></li>
                        <li><img src="https://z1.muscache.cn/im/pictures/64c2efd8-d81c-4611-a5f9-a9f4df274fe4.jpg?aki_policy=x_large" alt="Product Image 2"></li>
                        <li><img src="https://z1.muscache.cn/im/pictures/20334448/48387d04_original.jpg?aki_policy=x_large" alt="Product Image 3"></li>
                        <li><img src="https://z1.muscache.cn/im/pictures/20334317/fb23306e_original.jpg?aki_policy=x_large" alt="Product Image 4"></li>
                        <li><img src="https://z1.muscache.cn/im/pictures/20334595/c4c0724f_original.jpg?aki_policy=x_large" alt="Product Image 5"></li>
                    </ul>
                    <!-- cd-slider -->

                    <ul class="cd-slider-navigation">
                        <li><a href="#0" class="cd-prev inactive carousel-control left">&lsaquo;</a></li>
                        <li><a href="#0" class="cd-next carousel-control right">&rsaquo;</a></li>
                    </ul>
                    <!-- cd-slider-navigation -->
                </div>
                <!-- cd-slider-wrapper -->
            </section>
            <!-- cd-single-item -->

            <div>
                <section class="cd-content">
                    <p>Sit back in a private plunge pool and enjoy an uninterrupted vista of Table Mountain, the city skyline, and the ocean beyond.
                        The views are just as good from inside this chic and modern penthouse, where sunlight pours in through walls of windows.
                    </p>
                    <p>The apartment is in a truly wonderful neighbourhood - Vredehoek. It is centrally located in Cape Town's City Bowl. The area
                        is safe, clean, and beautifully situated on the slopes of famous Table Mountain. It's the perfect base for exploring the city.
                    </p>

                    <div class="cd-content-warning">The lister assumes full responsibility for this listing</div>
                    <div class="cd-content-flag">
                        <a><span class="fui fui-trash"></span> Flag as inappropriates</a>
                    </div>
                    <div class="gs-clear"></div>
                </section>
                <!-- /cd-content -->
                <div class="cd-updates">
                    <h2>
                        <span class="fui-star-2"></span> Amenities
                    </h2>
                    <ul>
                        <li>
                            <div class="updates-date">Strucutre</div>
                            <div class="updates-description"><b>1 bedroom</b> <b>1 bed</b> <b>1.5 baths</b></div>
                            <div class="gs-clear"></div>
                        </li>
                        <li>
                            <div class="updates-date">Amenties</div>
                            <div class="updates-description"><b>Free parking</b> <b>Pool</b> <b>Washer</b> <b>Dryer</b> <b>Dishwasher</b>
                                <b>Wireless Internet</b> <b>TV</b> <b>Hair dryer</b> <b>Coffee maker</b> <b>Pool</b> <b>Bathroom essentials</b>
                                <b>Bedroom comforts</b> <b>Full kitchen</b></div>
                            <div class="gs-clear"></div>
                        </li>
                    </ul>
                    <div class="gs-clear"></div>
                </div>
                <!-- /cd-updates -->
                <div class="cd-comments">
                    <h2>
                        <span class="fui-chat"></span> Reviews & Comments
                        <div class="toolbar">
                            <div class="btn-toolbar">
                                <div class="btn-group">
                                    <a class="btn btn-primary active" href="#fakelink"><span class="fui-heart"></span></a>
                                    <a class="btn btn-primary" href="#fakelink"><span class="fui-time"></span></a>
                                    <a class="btn btn-primary" href="#fakelink"><span class="fui-eye"></span></a>
                                </div>
                            </div>
                        </div>
                    </h2>
                    <div id="cd-media-list">
                        <ul class="media-list">
                            <li class="media">
                                <div class="media-left">
                                    <a href="#"><img class="media-object" src="images/character/blank.jpg" height="65" width="65"></a>
                                </div>
                                <div class="media-body">
                                    <div>
                                        <b><a>blank</a></b> We stayed at Gabriel's apartment as a treat for my 30th birthday.
                                        The views are incredible – waking up to a panorama of the city was pretty special and
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
        </div>

        <div class="gs-content-right">
            <h2 style="border: none;" class="visible-xs">
                <span class="fui-clip"></span> Seller's Info
            </h2>

            <div class="gs-seller">
                <div class="seller-thumb">
                    <a><img src="images/character/leone.jpg" height="70" width="70"></a>
                </div>
                <div class="seller-info">
                    <div class="name">
                        <a href="#"><b>MonsterCritic</b></a>
                    </div>
                    <div class="fans" onselectstart="return false">
                        <small><a id="be-fans"><span class="fui-heart fan"></span> <span class="be-fans-text">Become a fan</span></a>
                            (<span class="fans-num">32</span> fans)
                        </small>
                    </div>
                    <div class="badges">
                        <a href="#"><img src="images/badge/266770060211131.png" height="25" width="25"></a>
                        <a href="#"><img src="images/badge/2667700602111311.png" height="25" width="25"></a>
                        <a href="#"><img src="images/badge/2667700602111312.png" height="25" width="25"></a>
                        <a href="#"><img src="images/badge/2667700602111313.png" height="25" width="25"></a>
                        <a href="#"><img src="images/badge/2667700602111314.png" height="25" width="25"></a>
                    </div>
                </div>
                <div class="gs-clear"></div>
            </div>

            <div class="cd-item-info">
                <ul>
                    <li><span class="cd-item-icon fui-tag"></span><span class="cd-item-bid">350</span>
                        <small> $AUD / night</small>
                    </li>
                    <li class="cd-alert-warning"><span class="cd-item-icon fui-calendar"></span>
                        <span id="cd-alert-text">You will stay with us from</span></li>
                    <li class="no-icon">
                        <form>
                            <div id="cd-bid">
                                <input type="text" id="check-in" class="form-control" placeholder="yyyy-mm-dd"/>
                            </div>
                            <div id="cd-bid-submit">
                                <input type="button" value="Available?" class="btn btn-primary">
                            </div>
                            <div class="gs-clear"></div>
                        </form>
                    </li>
                    <li class="no-icon">
                        <div class="divider-left"></div>
                        <div style="float: left; color: #BDC3C7; font-size: 16px; padding: 0 5px;">to</div>
                        <div class="divider-right"></div>
                        <div class="gs-clear"></div>
                    </li>
                    <li class="no-icon">
                        <form>
                            <div id="cd-gin">
                                <input type="text" id="check-out" class="form-control" placeholder="yyyy-mm-dd"/>
                            </div>
                            <div id="cd-gin-submit">
                                <input type="button" value="Book now!" class="btn btn-primary">
                            </div>
                            <div class="gs-clear"></div>
                        </form>
                    </li>

                    <li><span class="cd-item-icon fui-time"></span>
                        <small><b class="cd-item-calendar">Wednesday, May 27, 2015 12:44:40</b></small>
                    </li>
                    <li onselectstart="return false"><a id="cd-add-watchlist"><span
                            class="cd-item-icon fui-heart watch"></span>
                        <small><b class="cd-item-watch">Add to watchlist </b></small>
                    </a>
                        <small> (<span class="watching-num">21</span> watching)</small>
                    </li>
                    <li><span class="cd-item-icon fui-location"></span>
                        <small><b class="cd-item-location gs-color-dsun">Sydney Centre </b></small>
                        <span class="cd-item-icon fui-home" style="padding-left: 40px;"></span>
                        <small><b class="cd-item-location">House </b></small>
                    </li>
                    <li>
                        <small style="margin-left: 35px;"><b>38 College St, Darlinghurst NSW 2000</b></small>
                    </li>
                </ul>
            </div>
            <!-- cd-item-info -->

            <div class="gs-item-others">
                <div style="padding-bottom: 5px;">
                    <span class="gs-icon fui fui-plus-circle"></span><b>Other posts you might like</b>
                </div>
                <ul>
                    <li>
                        <div class="item">
                            <div class="item-thumb">
                                <a href="#"><img src="images/item-1.jpg" height="100%" width="100%"></a>
                            </div>
                            <div class="item-title">
                                <a href="">Views, Expansive Space and Luxury in Heart of City</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div class="item-thumb">
                                <a href="#"><img src="images/item-3.jpg" height="100%" width="100%"></a>
                            </div>
                            <div class="item-title">
                                <a href="">Relaxing spacious villa Apartment with Garden, pool</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div class="item-thumb">
                                <a href="#"><img src="images/item-3.jpg" height="100%" width="100%"></a>
                            </div>
                            <div class="item-title">
                                <a href="">Stylish Studio S High above Cape Town</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div class="item-thumb">
                                <a href="#"><img src="images/item-1.jpg" height="100%" width="100%"></a>
                            </div>
                            <div class="item-title">
                                <a href="">Admire Sea Views from a Stunning Apartment by Clifton </a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div class="item-thumb">
                                <a href="#"><img src="images/item-1.jpg" height="100%" width="100%"></a>
                            </div>
                            <div class="item-title">
                                <a href="">Breezy Apartment Close to Camps Bay Beaches</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div class="item-thumb">
                                <a href="#"><img src="images/item-3.jpg" height="100%" width="100%"></a>
                            </div>
                            <div class="item-title">
                                <a href="">Laze at Infinity Pool from Villa in Peace and Quiet</a>
                            </div>
                        </div>
                    </li>
                    <div class="view-more">
                        <a href="/search" class="btn btn-default">view more</a>
                    </div>
                    <div class="gs-clear"></div>
                </ul>
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
