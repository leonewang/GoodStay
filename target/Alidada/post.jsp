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
                <form  action="/PostServlet" method="post"<%-- onsubmit="return checkList();--%>">
                    <input type="text" name="id" value="<%=user.getId()%>" hidden/>
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
                        <div class="list-input" id="locationField">
                            <input id="autocomplete" type="text" class="form-control" name="address" onFocus="geolocate()"
                                   placeholder="e.g. 3/17 Mascot Drive, Eastlakes NSW"/>
                        </div>
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
                        <div class="list-dropzone list-input">
                            <div id="dropz" class="dropzone list-right"></div>
                            <input id="photos" type="text" name="photos" value="1" hidden/>
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
                            <textarea class="form-control" rows="5" name="description" placeholder="Within 1000 characters ..."></textarea>
                        </div>
                    </div>

                    <div class="list-unlock gs-color-dclouds"><small><span class="fui-check-circle"></span>&nbsp;Make a quick deal by introducing your place <a href="#">in details</a> !</small></div>

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
                            <strong>Alidada Match</strong><a href="#"><span style="margin-left: 7px;" class="fui-question-circle gs-color-greensea"></span></a>
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCM_XHyreD0F1r-uT2f6OtCDnkWfcfHxy8&libraries=places"
        type="text/javascript"></script>
<script>
    $(document).ready(function() {
        $('.input-daterange').datepicker({
            format: "yyyy-mm-dd"
        });
    });

    $("select").select2({
        dropdownCssClass : 'dropdown-inverse'
    });

    // This example displays an address form, using the autocomplete feature
    // of the Google Places API to help users fill in the information.

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

    var placeSearch, autocomplete;
    var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
    };

    function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
    }

    function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
            document.getElementById(component).value = '';
            document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
            var addressType = place.address_components[i].types[0];
            if (componentForm[addressType]) {
                var val = place.address_components[i][componentForm[addressType]];
                document.getElementById(addressType).value = val;
            }
        }
    }

    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    function geolocate() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var geolocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var circle = new google.maps.Circle({
                    center: geolocation,
                    radius: position.coords.accuracy
                });
                autocomplete.setBounds(circle.getBounds());
            });
        }
    }
</script>
</body>
</html>
