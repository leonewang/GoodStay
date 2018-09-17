<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Post | GoodStay</title>
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
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
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

<div class="gs-container container">
    <div id="list-alert" class="alert alert-success alert-dismissible" role="alert">
        <span class="gs-alert-icon fui-info-circle"></span><span class="gs-color-dsun"><strong>Get 1,000 Bonus Credits for listing Apartment & Unit today!</strong></span><strong> Also get 1,000 Bonus Credits by filling your details! <a>Click to do it! </a></strong>
        <p>
            <small>To receive this bonus:</small>
        </p>
        <ol>
            <li>Go to the Post page:<strong><a class="alert-link" href="http://localhost:8080/post.jsp">www.goodstay.com/post</a></strong></li>
            <li>Describe your place, and don't forget tell us the <strong class="gs-color-greensea">dwelling type</strong>
            </li>
            <li>Add at least <strong>1 photo</strong> and offer <strong>an appropriate price</strong> on it.
            </li>
            <li>List somewhere good! Deleted or prohibited places will not qualify. Posting must be newly listed during the promotion.</li>
        </ol>
    </div>
    <!-- /custom alert -->

    <div class="gs-content">
        <div class="gs-content-left">
            <div class="list-form">
                <form  action="/PostServlet" method="post" onsubmit="return checkList();">
                    <input type="text" name="id" value="<%=user.getId()%>" hidden/>
                    <div id="list-title">
                        <div class="list-text">
                            <strong>Title</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <input type="text" class="form-control" name="title" placeholder="Within 15 characters ..." />
                        </div>
                    </div>

                    <div id="list-area">
                        <div class="list-text">
                            <strong>Area</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <select data-toggle="select" class="form-control select select-primary" name="area">
                                <option value="1" selected>Sydney Centre</option>
                                <option value="2">West Sydney</option>
                                <option value="3">South Sydney</option>
                                <option value="4">East Sydney</option>
                                <option value="5">North Sydney</option>
                                <option value="6">Other areas</option>
                            </select>
                        </div>
                    </div>

                    <div id="list-address">
                        <div class="list-text">
                            <strong>Address</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <input type="text" class="form-control" name="address" placeholder="e.g. 3/17 Mascot Drive, Eastlakes"/>
                        </div>
                    </div>

                    <div id="list-categories">
                        <div class="list-text">
                            <strong>Dwelling Type</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <select multiple="multiple" class="form-control multiselect multiselect-primary" name="typeId" style="width: 100%;">
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
                    </div>

                    <div id="list-photo">
                        <div class="list-text">
                            <strong>Photo</strong> <span class="gs-color-dsun">&nbsp;&nbsp;</span>
                        </div>
                        <div class="list-dropzone list-input">
                            <div id="dropz" class="dropzone list-right"></div>
                            <input type="text" name="images" value="" hidden/>
                        </div>
                    </div>

                    <div id="list-photo-tip">
                        <span class="fui-heart gs-color-pink"></span><small class="gs-color-dsun gs-text-sm"> &nbsp;&nbsp;Your first image will appear in search results!</small>
                    </div>

                    <div id="list-description">
                        <div class="list-text">
                            <strong>Description</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <textarea class="form-control" rows="5" name="message" placeholder="Within 300 characters ..."></textarea>
                        </div>
                    </div>

                    <div class="list-unlock gs-color-dclouds"><small><span class="fui-check-circle"></span>&nbsp;Make a quick deal by introducing your place <a href="#">in details</a> !</small></div>

                    <div id="list-cash">
                        <div class="list-text">
                            <strong>Price</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <input type="text" class="form-control input-sm list-input" name="cash" /> &nbsp;&nbsp;<small>AUD$ / night</small>
                        </div>
                    </div>

                    <div id="list-bargain">
                        <div class="list-text">
                            <strong>Parking</strong>
                        </div>
                        <div class="list-input">
                            <label class="radio">
                                <input type="radio" name="bargain" id="list-radio-true" value="true" data-toggle="radio">
                                Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </label>
                            <label class="radio">
                                <input type="radio" name="bargain" id="list-radio-true" value="false" data-toggle="radio" checked="">
                                No
                            </label>
                            <div class="gs-clear"></div>
                        </div>
                    </div>

                    <div id="list-time">
                        <div class="list-text"><strong>Available Date</strong> <span class="gs-color-dsun">*</span></div>
                        <div class="input-daterange input-group list-input" id="datepicker">
                            <input type="text" class="input-sm form-control" name="checkindate" />
                            <span class="input-group-addon input-sm">to</span>
                            <input type="text" class="input-sm form-control" name="checkindate" />
                        </div>
                    </div>

                    <!-- <div id="list-relist">
                        <div class="list-input">
                            <div class="bootstrap-switch-square">
                                <input type="checkbox" checked data-toggle="switch" id="list-switch" data-on-text="<span class='fui-check'></span>" data-off-text="<span class='fui-cross'></span>" />
                            </div>
                        </div>
                    </div> -->

                    <div id="list-submit">
                        <button type="submit" class="btn btn-primary btn-embossed btn-block">Submit</button>
                    </div>

                    <div id="list-rule">
                        <p class="gs-color-dclouds">
                            By clicking 'Submit', you agree to abide by our <a href="#">listing rules and terms</a> of use. You also agree to follow through on your listing
                            regardless of the amount of money. Users who are in violation of these terms may be suspended.
                        </p>
                    </div>
                </form>
            </div>
        </div>

        <div class="gs-content-right">
            <h2 style="border: none; margin-top: -35px;">Quick deal?</h2>
            <div id="first-row">
                <small><strong>Tip:</strong> Maybe you can try to <strong>add more photos</strong> & <strong>write an introduction explicitly</strong>, then it would get a better placement in search & attract more users on your listing.</small>
            </div>
            <h2 style="border: none;">Listing Summary</h2>
            <div id="third-row">
                <small>Beware of <strong>Internet Fraud</strong>, you should double check <strong> poster's personal information & feedbacks from other users</strong></a>.<br /> You can also make a phone call or just go for a look.</small>
            </div>

            <h2 id="list-error-title" class="gs-hidden">Something wrong</h2>
            <div id="fourth-row" class="gs-hidden error">
                <small>test line</small>
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
<script src="js/vendor/sweetalert-dev.js"></script>
<script src="js/vendor/dropzone.js"></script>
<script src="js/assets/bootstrap-datepicker.min.js"></script>
<!-- Custom jquery sentences -->
<script src="js/backtop.js"></script>
<script src="js/goto-stuff.js"></script>
<script src="js/alert.js"></script>
<script src="js/dropzone.custom.js"></script>
<script src="js/formCheck.js"></script>
<!-- <script src="../js/deleteUpload.js"></script> -->
<script>
    $(document).ready(function() {
        $('.input-daterange').datepicker({
            format: "yyyy-mm-dd"
        });
    });

    $("select").select2({
        dropdownCssClass : 'dropdown-inverse',
        maximumSelectionSize : 1
    });
</script>
</body>
</html>
