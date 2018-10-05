<%@ page import="model.User" %>
<%@ page import="java.util.UUID" %>
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
            border-radius: 5px;
        }
        #infowindow-content {
            display: none;
        }
        #map #infowindow-content {
            display: inline;
        }
        #map {
            height: 300px;
            border: 2px solid #bdc3c7;
            border-radius: 6px;
            margin-bottom: 30px;
        }
        #qiniupercent {
            height: 15px;
            width: 100%;
            padding: 0;
            margin: 10px 0 0 7%;
            border: none;
            border-radius: 3px;
            background-color: #1ABC9C;
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
                <form action="/PostServlet" method="post">
                    <input type="text" name="id" value="<%=user.getId()%>" hidden/>
                    <input type="text" name="postID" value="<%=UUID.randomUUID().toString()%>" id="post_id" hidden/>
                    <div id="list-title">
                        <div class="list-text">
                            <strong>Title</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <input type="text" class="form-control" name="title" placeholder="Within 100 characters ..." />
                        </div>
                    </div>

                    <div id="list-address">
                        <div class="list-text">
                            <strong>Address</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <input id="pac-input" type="text" class="form-control" name="address" onFocus="geolocate()"
                                   placeholder="e.g. 3/17 Mascot Drive, Eastlakes NSW" onkeydown="if(event.keyCode==13){return false;}"/>
                        </div>
                    </div>

                    <div style="display: none;">
                        <input type="text" value="" name="placeid" id="placeid"/>
                        <input type="text" value="" name="coordinate" id="coordinate"/>
                    </div>

                    <div id="list-area">
                        <div class="list-text">
                            <strong>City</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <input id="locality" type="text" class="form-control" name="city" placeholder="e.g. Mascot"/>
                        </div>
                    </div>

                    <div id="list-dwelling">
                        <div class="list-text">
                            <strong>Dwelling Type</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <select data-toggle="select" class="form-control select select-primary" name="type" style="min-width: 150px; width: 175px;">
                                <option value="Apartment & Unit">Apartment & Unit</option>
                                <option value="House">House</option>
                                <option value="Townhouse & Villa">Townhouse & Villa</option>
                                <option value="Others">Others</option>
                            </select>
                        </div>
                    </div>

                    <div id="list-categories">
                        <div class="list-text">
                            <strong>Demands</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <select multiple="multiple" class="form-control multiselect multiselect-primary" name="demands" style="width: 100%;">
                                <optgroup label="People">
                                    <option value="1 People">1 People</option>
                                    <option value="2 People" selected>2 People</option>
                                    <option value="3 People">3 People</option>
                                    <option value="More than 3 People">More than 3 People</option>
                                </optgroup>
                                <optgroup label="Bedroom">
                                    <option value="1 Bedroom" selected>1 Bedroom</option>
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
                    </div>

                    <div id="list-amenities">
                        <div class="list-text">
                            <strong>Amenities</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <select multiple="multiple" class="form-control multiselect multiselect-primary" name="amenities" style="width: 100%;">
                                <optgroup label="Commons">
                                    <option value="Wireless Internet" selected>Wireless Internet</option>
                                    <option value="Free parking">Free parking</option>
                                    <option value="Washer">Washer</option>
                                    <option value="Dryer" selected>Dryer</option>
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
                    </div>

                    <div id="list-photo">
                        <div class="list-text">
                            <strong>Photo</strong> <span class="gs-color-dsun">&nbsp;&nbsp;</span>
                        </div>
                        <div class="list-input">
                            <div id="container" style="width: 30%;float: left;">
                                <a class="btn btn-sm btn-primary" id="pickfiles" href="#" style="width: 100%;">
                                    <span id="image-num">Upload</span><span id="total-num"></span></a>
                            </div>
                            <div style="width: 65%;float: left;"><button type="button" id="qiniupercent" style="width: 0%;"></button></div>
                        </div>
                    </div>

                    <div id="list-photo-tip">
                        <span class="fui-heart gs-color-pink"></span><small class="gs-color-dsun gs-text-sm"> &nbsp;&nbsp;Your first uploaded image will appear in search results!</small>
                    </div>

                    <div id="list-description">
                        <div class="list-text">
                            <strong>Description</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <textarea class="form-control" rows="5" name="description" placeholder="Within 1000 characters ..."></textarea>
                        </div>
                    </div>

                    <div class="list-unlock gs-color-dclouds"><small><span class="fui-check-circle"></span>
                        &nbsp;Make a quick deal by introducing your place <a href="#">in details</a> !</small>
                    </div>

                    <div id="list-cash">
                        <div class="list-text">
                            <strong>Price</strong> <span class="gs-color-dsun">*</span>
                        </div>
                        <div class="list-input">
                            <input type="text" class="form-control input-sm list-input" name="price" /> &nbsp;&nbsp;<small>AUD$ / night</small>
                        </div>
                    </div>

                    <div id="list-bargain">
                        <div class="list-text">
                            <strong>Alidada Match</strong><a href="/help.jsp"><span style="margin-left: 7px;" class="fui-question-circle gs-color-greensea"></span></a>
                        </div>
                        <div class="list-input">
                            <label class="radio">
                                <input type="radio" name="alidadamatch" value="true" data-toggle="radio">
                                Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </label>
                            <label class="radio">
                                <input type="radio" name="alidadamatch" value="false" data-toggle="radio" checked="">
                                No
                            </label>
                            <div class="gs-clear"></div>
                        </div>
                    </div>

                    <div id="list-time">
                        <div class="list-text"><strong>Available Date</strong> <span class="gs-color-dsun">*</span></div>
                        <div class="input-daterange input-group list-input" id="datepicker">
                            <input type="text" class="input-sm form-control" name="start_date" />
                            <span class="input-group-addon input-sm">to</span>
                            <input type="text" class="input-sm form-control" name="end_date" />
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

            <div id="map"></div>
            <div id="infowindow-content">
                <span id="place-name"  class="title"></span>
                <span id="place-id"></span><span id="place-address"></span><span id="place-coordinate"></span>
            </div>

            <h2 style="border: none; margin-top: -35px;">Where is the place?</h2>
            <div id="first-row">
                <small>Just try to <strong>fill in the address</strong>, then you will get the location shown in tha map above. (Google Map API Used.)</small>
            </div>
            <h2 style="border: none;">Tips here</h2>
            <div id="third-row">
                <small>Maybe you can try to <strong>add more photos</strong> & <strong>write an introduction explicitly</strong>, then it would get a better placement in search & attract more users on your listing.</small><br>
                <small>Also, beware of <strong>Internet Fraud</strong>, you should double check <strong> poster's personal information & feedbacks from other users</strong></a>.<br /> You can also make a phone call or just go for a look.</small>
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
<script src="js/assets/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="https://cdn.staticfile.org/plupload/2.1.9/moxie.js"></script>
<script type="text/javascript" src="https://cdn.staticfile.org/plupload/2.1.9/plupload.dev.js"></script>
<script type="text/javascript" src="https://cdn.staticfile.org/qiniu-js-sdk/1.0.14-beta/qiniu.min.js"></script>
<script src="js/qiniuImg.js"></script>

<!-- Custom jquery sentences -->
<script src="js/backtop.js"></script>
<script src="js/goto-stuff.js"></script>
<script src="js/alert.js"></script>
<script src="js/formCheck.js"></script>
<!-- <script src="../js/deleteUpload.js"></script> -->
<script>
    $("select").select2({
        dropdownCssClass : 'dropdown-inverse'
    });

    // This sample uses the Place Autocomplete widget requesting only a place
    // ID to allow the user to search for and locate a place. The sample
    // then reverse geocodes the place ID and displays an info window
    // containing the place ID and other information about the place that the
    // user has selected.

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: -33.8688, lng: 151.2195},
            zoom: 13
        });

        var input = document.getElementById('pac-input');

        var autocomplete = new google.maps.places.Autocomplete(
            input, {placeIdOnly: true});
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        var placeID = document.getElementById('placeid');
        var placeCoordinate = document.getElementById('coordinate');
        infowindow.setContent(infowindowContent);
        var geocoder = new google.maps.Geocoder;
        var marker = new google.maps.Marker({
            map: map
        });
        marker.addListener('click', function() {
            infowindow.open(map, marker);
        });

        autocomplete.addListener('place_changed', function() {
            infowindow.close();
            var place = autocomplete.getPlace();

            if (!place.place_id) {
                return;
            }
            geocoder.geocode({'placeId': place.place_id}, function(results, status) {

                if (status !== 'OK') {
                    window.alert('Geocoder failed due to: ' + status);
                    return;
                }
                map.setZoom(13);
                map.setCenter(results[0].geometry.location);
                // Set the position of the marker using the place ID and location.
                marker.setPlace({
                    placeId: place.place_id,
                    location: results[0].geometry.location
                });
                marker.setVisible(true);
                infowindowContent.children['place-name'].textContent = place.name;
                placeID.setAttribute('value', place.place_id);
                placeCoordinate.setAttribute('value', results[0].geometry.location);
                infowindow.open(map, marker);
            });
        });
    }

    /*
	页面加载完毕 发起请求获取七牛token
	* 之后调用上传组件构造方法[qiniuImg.js]
	*/
    function getTokenMessage() {
        $.ajax({
            url: "UptokenServlet",
            type: 'POST',
            data: {},
            dataType : 'html',
            success: function (data) {
                uploaderReady(data);
            }
        });
    }

    $(document).ready(function(){
        $('.input-daterange').datepicker({
            format: "yyyy-mm-dd"
        });
        getTokenMessage();
    });
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCM_XHyreD0F1r-uT2f6OtCDnkWfcfHxy8&libraries=places&callback=initMap"
        async defer></script>
</body>
</html>
