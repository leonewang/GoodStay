<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Index | GoodStay</title>
    <!-- Loading Bootstrap -->

    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <style>
        #new-saved-search>div>div {
            padding: 5px 0;
        }
        .row .alert-success .gs-alert-input div {
            float:left;
            margin-right: 20px;
        }
    </style>
</head>
<body>
<!-- carousel -->
<div id="myCarousel" class="carousel slide">
    <div class="carousel-inner">
        <div class="item item1 active">
            <div class="container">
                <div class="carousel-caption">
                    <h3 class="text-left" style="color: #2C3E50; text-shadow: none;">Welcome your first guest</h3>
                    <p class="text-left" style="color: #2C3E50; text-shadow: none;">Once your listing is live, qualified guests can reach out. You can message them with any questions before their stay.</p>
                    <a class="btn btn-large btn-inverse" href="post.jsp">Go to post</a>
                </div>
            </div>
        </div>
        <div class="item item3">
            <div class="container">
                <div class="carousel-caption">
                    <h3 class="text-left" style="color: #fff;">Turn your extra space into extra income</h3>
                    <p class="text-left" style="color: #fff;">Share any space without sign-up charges, from a shared living room to a second home and everything in-between.</p>
                    <a class="btn btn-large btn-primary" href="signup.jsp">Sign up today</a>
                </div>
            </div>
        </div>
        <div class="item item2">
            <div class="container">
                <div class="carousel-caption">
                    <h3 class="text-left">Decide how you want to host</h3>
                    <p class="text-left">Choose your own schedule, prices, and requirements for guests. We’re there to help along the way.</p>
                    <a class="btn btn-large btn-success" href="signin.jsp">Sign in</a>
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a> <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
<!-- /carousel -->

<!-- custom navbar -->
<div class="container">
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
                    <li><a href="help.jsp">Help</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><button onclick="window.location.href='signin.jsp'" class="btn btn-primary btn-sm btn-sign gs-text-md">Sign in</button>
                        <button onclick="window.location.href='signup.jsp'" class="btn btn-success btn-sm btn-sign gs-text-md">Sign up</button>
                    </li>

                    <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="visible-xs">Settings<span class="fui-gear"></span></span><span
                            class="visible-sm visible-md visible-lg"><span class="fui-gear"></span></span></a>
                        <ul class="dropdown-menu">
                            <li id="li-dark" class="visible-xs"><a href="#" id="dark"><span class="fui-eye" aria-hidden="true"></span> Dark</a></li>
                            <li><a href="#"><span class="fui-question-circle" aria-hidden="true"></span> FAQ</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</div>
<!-- /custom navbar -->

<!-- content -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <!-- search -->
                <div id="flash-saved-search" class="alert alert-success" role="alert">
                    <form id="new-saved-search" accept-charset="UTF-8" action="/AdvancedSearchServlet" method="post">
                        <div class="gs-alert-input" style="padding-top:2px;">
                            <div>
                                <label style="padding-top:3px;">Price</label>
                            </div>
                            <div>
                                <input name="min-price" class="form-control" placeholder="Min: $" style="width: 75px">
                            </div>
                            <div>
                                <input name="max-price" class="form-control" placeholder="Max: $" style="width: 75px">
                            </div>
                            <div>
                                <label style="padding-top:3px;">Demands</label>
                            </div>
                            <div class="list-input" style="margin-right: 0px;">
                                <select data-toggle="select" multiple class="form-control multiselect multiselect-primary" name="demands" style="width: 240px;">
                                    <optgroup label="People">
                                        <option value="1 People">1 People</option>
                                        <option value="2 People" selected>2 People</option>
                                        <option value="3 People">3 People</option>
                                        <option value="More than 3 People">More than 3 People</option>
                                    </optgroup>
                                    <optgroup label="Bedroom">
                                        <option value="1 Bedroom">1 Bedroom</option>
                                        <option value="2 Bedrooms">2 Bedrooms</option>
                                        <option value="3 Bedrooms">3 Bedrooms</option>
                                        <option value="More than 3 Bedrooms">More than 3 Bedrooms</option>
                                    </optgroup>
                                    <optgroup label="Bed">
                                        <option value="1 Bed">1 Bed</option>
                                        <option value="2 Beds">2 Beds</option>
                                        <option value="3 Beds">3 Beds</option>
                                        <option value="More than 3 Beds">More than 3 Beds</option>
                                    </optgroup>
                                    <optgroup label="Bathroom">
                                        <option value="1 Bathroom">1 Bathroom</option>
                                        <option value="1.5 Bathrooms">1.5 Bathrooms</option>
                                        <option value="2 Bathrooms">2 Bathrooms</option>
                                        <option value="More than 2 Bathrooms">More than 2 Bathrooms</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div>
                                <label style="padding-top:3px;">Amenities</label>
                            </div>
                            <div class="list-input" style="margin-right: 0px;">
                                <select data-toggle="select" multiple class="form-control multiselect multiselect-primary" name="amenities" style="width: 240px;">
                                    <optgroup label="Commons">
                                        <option value="Wireless Internet">Wireless Internet</option>
                                        <option value="Free parking" selected>Free parking</option>
                                        <option value="Washer">Washer</option>
                                        <option value="Dryer">Dryer</option>
                                        <option value="Hair dryer">Hair dryer</option>
                                        <option value="Bathroom essentials">Bathroom essentials</option>
                                        <option value="Bedroom comforts">Bedroom comforts</option>
                                    </optgroup>
                                    <optgroup label="Uncommons">
                                        <option value="Pool" >Pool</option>
                                        <option value="Dishwasher">Dishwasher</option>
                                        <option value="Coffee maker">Coffee maker</option>
                                        <option value="Full kitchen">Full kitchen</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div>
                                <label style="padding-top:3px;">Check in</label>
                            </div>
                            <div>
                                <input autocomplete="off" id='checkindate' name="check-in" class="form-control" placeholder="yyyy-mm-dd" style="width: 110px">
                            </div>
                            <div>
                                <label style="padding-top:3px;">Check out</label>
                            </div>
                            <div>
                                <input autocomplete="off" id='checkoutdate' name="check-out" class="form-control" placeholder="yyyy-mm-dd" style="width: 110px">
                            </div>
                            <div>
                                <label style="padding-top:3px;">Type</label>
                            </div>
                            <div class="list-input">
                                <select data-toggle="select" class="form-control select select-primary" name="type" style="min-width: 150px; width: 175px;">
                                    <option value="All">All</option>
                                    <option value="Apartment & Unit">Apartment & Unit</option>
                                    <option value="House">House</option>
                                    <option value="Townhouse & Villa">Townhouse & Villa</option>
                                    <option value="Others">Others</option>
                                </select>
                            </div>
                            <div>
                                <label style="padding-top:3px;">City</label>
                            </div>
                            <div class="list-input" style="margin-bottom: 10px;">
                                <input name="city" class="form-control" placeholder="e.g. Mascot" style="width: 150px">
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-primary warning-save btn-block btn-embossed">Search</button>
                        </div>
                    </form>
                    <div class="gs-clear"></div>
                </div>
                <!-- /custom search -->
            </div>
            <!-- /row -->
        </div>
    </div>

    <div class="row featurette1">
        <h2 class="featurette-heading text-center">
            How to start hosting
        </h2>
        <div style="color: rgb(234, 109, 134);"><svg viewBox="0 0 132 10" preserveAspectRatio="none" focusable="false" style="height: 12px; width: 40%;"><path fill="currentColor" d="M12.794 25.962c.166-.054.334-.106.5-.161-.083.03-.244.084-.513.168l.013-.007M131.946.954c-.248-.748-1.15-1.071-1.943-.916-.385.075-.774.123-1.163.176-.116.011-.232.025-.348.037-.287.03-.574.056-.862.082-1.376.124-2.755.215-4.135.293-3.69.21-7.385.339-11.079.448-8.249.245-16.502.375-24.755.47-7.757.092-15.514.157-23.27.228-9.215.084-18.43.129-27.647.093-10.137-.04-20.275-.12-30.413-.151-1.748-.006-3.495 0-5.242.048-1.465.04-1.442 1.864.009 1.931 5.371.25 10.763.271 16.145.34-3.689.563-7.376 1.175-11.012 1.942-1.28.27-3.437.499-4.225 1.587-.58.8.227 1.998 1.3 1.887 5.935-.613 11.88-1.223 17.843-1.582 5.288-.32 10.63-.445 15.908.074a46 46 0 0 1 7.44 1.355c1.9.511 2.756-2.002.826-2.554-4.66-1.331-9.644-1.717-14.51-1.784a115.74 115.74 0 0 0-5.024.045c.68-.116 1.36-.23 2.04-.347.827-.143 1.679-.262 2.51-.44l3.43.037c8.904.097 17.807.127 26.712.107 8.294-.02 16.59-.07 24.884-.153 8.078-.08 16.156-.194 24.231-.4 3.92-.1 7.841-.22 11.759-.406 2.792-.133 5.6-.266 8.37-.634.378-.05.754-.109 1.128-.182.787-.153 1.324-.932 1.093-1.63"></path></svg></div>
        <a class="get-started btn btn-lg btn-primary btn-embossed" href="#step1">Get started</a>
    </div>
    <div class="featurette2" id="step1">
        <img src="https://a0.muscache.com/pictures/788cdf62-dc3a-4149-ac0e-b37909436319.jpg" width="48" height="48" alt="">
        <h4>Host whenever you want</h4>
        <p>There's no minimum or mandatory time you have to host, so you can block off dates when you're not available. </p>
        <p>You can also set rules about your availability, including:</p>
        <p>- Min/max nights a guest can stay</p>
        <p>- How far in the future guests can book</p>
        <p>- Advance notice needed before a booking</p>
        <hr>
        <img class="_1u6feuz3" src="https://a0.muscache.com/pictures/b1d5dc1c-34ed-442d-8b03-7914166861ce.jpg" width="48" height="48" alt="">
        <h4>Quickly coordinate calendars</h4>
        <p>To avoid getting booked when you can't host or have an existing reservation, you can connect your Airbnb calendar with your other calendars. This allows you to keep all calendars up-to-date automatically.</p>
    </div>
</div>

<!-- /content -->

<footer>
    <div class="container-fluid">
        <div class="col-sm-5 col-sm-offset-1 col-xs-12">
            <h3 class="footer-title">Subscribe</h3>
            <p>
                Do you like this website? Want to get more information like this?<br /> Subscribe to us and updates to stay tuned on great ideas.<br />
                Go to&nbsp;<a href="https://github.com/leonewang/GoodStay" target="_blank"> GoodStay in Github</a><br /> Thanks to&nbsp;<a
                    href="https://getbootstrap.com/" target="_blank"> Bootstrap and all Open Source Widgets we used.</a>
            </p>
        </div>
        <div class="col-sm-5 col-xs-11">
            <div class="footer-banner">
                <h3 class="footer-title">Assist Us</h3>
                <p>
                    FAQ: <a href="" target="_blank">GoodStay.com/issue</a><br /> Email: <a
                        href="mailto:wangleone.me@gmail.com?subject=FAQ from MonsterCritic&body=Title:%0d%0aTyping something%0d%0a%0d%0aDescription:%0d%0aTyping the question you meet in detail">goodstay@gmail.com</a>
                </p>
            </div>
        </div>
        <a href="#" class="visible-xs"><span class="fui-triangle-up"></span> Top</a>
    </div>
</footer>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/assets/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script src="js/assets/bootstrap-datepicker.min.js"></script>

<!-- Custom jquery sentences -->
<script src="js/backtop.js"></script>
<script src="js/goto-stuff.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#checkindate').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true
        });
        $('#checkoutdate').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true
        });
    });
</script>
</body>
</html>