<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Notification | GoodStay</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <style>
        .notification {
            background-color: #ecf0f5;
            border-radius: 6px;
            position: relative;
            padding: 20px;
            margin: 10px 0 15px 0;
        }

        .notification:before {
            content: "";
            border-style: solid;
            border-width: 0 9px 9px 9px;
            border-color: transparent transparent #ecf0f5 transparent;
            height: 0px;
            position: absolute;
            left: 23px;
            top: -9px;
            width: 0px;
            -webkit-transform: rotate(360deg);
        }
    </style>
</head>
<body style="padding-top: 70px;">
<!-- /custom navbar -->
<%@include file="nav.jsp"%>
<div class="container">
    <div>
        <div><h4>Questions? You're in the right place.</h4></div>

        <!-- info alert -->
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <span class="gs-alert-icon fui-info-circle"></span>You will find how it works soon. Discover unique places to stay anywhere in the world.
        </div>

        <b>What is Alidada Match?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    <a href="#"><b>AlidadaMatchSystem</b></a> which enables the buyer to simply leave the detail of his interest with the maximum price and the intended period to stay, the system will then search for the corresponding matches found & notify to the buyer.
                </span><p></p>
                <span>Likewise, for advertisers, once they have selected the AlidadaMatch the system will find the potential buyers that have expressed their interest, and able to give a list so the renter can contact the owner. This intelligent system simplified the process between two & only making relevant information visible to them, we are confident with this feature the process will be more enjoyable.</span>
            </div>
        </div>

        <b>How do I book a stay?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    The website is a marketplace that allows people like you to list and find accommodation. It has been designed to help you find the perfect holiday accommodation based on your wants and needs.
                </span><p></p>
                <a><b>Search</b></a><br>
                <span>Start by entering your travel destination, dates and number of guests on our <a href="/wall.jsp">homepage</a>. You can easily refine your search results by selecting a more specific location, a price range or other preferences. You can also use the map to explore various regions and areas. Be sure to review the details of properties you're interested in including photos, reviews and features.</span><p></p>
                <a><b>Book</b></a><br>
                <span>Once you find a property that's right for you, click on the <b>Book Now!</b> button. You will be provided with one of two options for submitting a booking request depending upon the owner or property manager's preference.</span>
            </div>
        </div>

        <b>What do I do if I do not receive a response to my enquiry?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    Website encourages travellers to call property managers rather than communicate with them via email. You can usually find a property manager's contact details in the enquiry confirmation email that you receive from GoodStay making your initial enquiry or booking request.
                </span>
            </div>
        </div>

        <b>How do I contact a property owner or manager to make a booking?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    Contacting an owner or property manager in order to book a property is best completed by first going to the website.
                </span><p></p>
                <span><b>1.</b> Locate the listing on the website by entering their property name or property ID in the search field. </span><br>
                <span><b>2.</b> Click on <b>Book Now!</b> to make a booking or <b>Send a message</b> to send an enquiry to the owner.</span><br>
                <span><b>3.</b> Fill in the form with your details.</span><br>
                <span><b>4.</b> Submit.</span><p></p>
                <span>Once the form has successfully been submitted, you will see a confirmation page on the website, including the next steps to follow. A confirmation email will then be sent to the email address you have made your Enquiry or Booking request usually within fifteen minutes</span>
            </div>
        </div>

        <b>How long does it usually take for a listing owner/manager to respond to a booking request?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    We encourage property owners and managers to respond to booking requests within 24 hours. If an owner doesn't confirm your booking within 24 hours, your booking will expire and no charge will be placed your credit card. We recommend making a booking request on other properties in the area.
                </span>
            </div>
        </div>

        <b>How do I reset my password?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    Follow these steps to reset your password:
                </span><p></p>
                <span><b>1.</b> Navigate to the Admin login page. You can do this by your web browser, and then selecting Owner Login.</span><br>
                <span><b>2.</b> Under the “Reset your password” section, enter the email address you use for receiving enquiries and booking requests.</span><br>
                <span><b>3.</b> An email will be sent to the above email address with instructions to reset your password.</span><p></p>
                <span>If you experience any problems with this, please contact our support team using the <a>Message icon</a> button at the right bottom of this page.</span>
            </div>
        </div>

        <b>How do I view my booking details?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    Your booking details can be found within your first confirmation email from Goodstay. This email has important information such as the property manager's name, email address and phone number.
                </span><p></p>
                <span><b>1.</b> Navigate to the Admin login page. You can do this by your web browser, and then selecting Owner Login.</span><br>
                <span><b>2.</b> Under the “Reset your password” section, enter the email address you use for receiving enquiries and booking requests.</span><br>
                <span><b>3.</b> An email will be sent to the above email address with instructions to reset your password.</span><p></p>
                <span>If you experience any problems with this, please contact our support team using the <a>Message icon</a> button at the right bottom of this page.</span>
            </div>
        </div>

        <b>Why post page always show the new advertisement?</b>
        <div>
            <div class="notification gs-text-md">
                <span>
                    Firstly, when user post a new advertisement, it enables most of users to watch the new advertisement immediately in post page, it also makes users to watch different advertisement in different time rather than always the same information.
                </span><p></p>
                <span>Secondly, update new information is important for users to know different type of advertisement, as different property provider, they also hope to publish their advertisement immediately, then users can search their property soon, for visitor, they can book fast if they find a suitable room, for provider, the post page ensure them to release their room fast.</span>
            </div>
        </div>

    </div>
</div>

<!-- /custom footer -->
<%@include file="footer.jsp"%>

<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
</body>
</html>
