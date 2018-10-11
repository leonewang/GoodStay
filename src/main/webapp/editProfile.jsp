<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Edit | GoodStay</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <style>
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
<%
    Boolean isFemale;
    Boolean isMale;
    if (user.getGender().equals("female")) {
        isFemale = true;
        isMale = false;
    } else {
        isMale = true;
        isFemale = false;
    }
%>
<div class="container">
    <div>
        <div><h4>Edit Profile</h4></div>
        <div>
            <form action="/EditProfileServlet" method="post">
                <div class="form-group">
                    <input type="text" id="user-id" name="id" value="<%=user.getId()%>" hidden/>
                </div>
                <div class="form-group">
                    <strong>Avatar</strong>
                </div>
                <div class="form-group">
                    <div id="container" style="width: 30%;float: left;">
                        <a class="btn btn-sm btn-primary" id="pickfiles" href="#" style="width: 100%;">
                            <span id="image-num">Upload</span><span id="total-num"></span></a>
                    </div>
                    <div style="width: 65%;float: left;"><button type="button" id="qiniupercent" style="width: 0%;"></button></div>
                </div>
                <div class="gs-clear"></div>
                <div class="form-group">
                    <strong>Username</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> Your user name is the unique identifier, so it can not be changed since the account had been created!</small>
                </div>
                <div class="form-group">
                    <input type="text" disabled="disabled" class="form-control" name="username" placeholder="<%=user.getUser_name()%>" />
                </div>

                <div class="form-group">
                    <strong>Password</strong> <span class="gs-color-dsun">*</span>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" value="<%=user.getPassword()%>" />
                </div>

                <div class="form-group">
                    <strong>Email</strong> <span class="gs-color-dsun">*</span>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="email" value="<%=user.getEmail()%>" />
                </div>

                <div class="form-group"><strong>Nick name</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="name" value="<%=user.getName()%>" />
                </div>

                <div class="form-group">
                    <div class="list-text"><strong>Gender</strong></div>
                    <div class="list-input">
                        <label class="radio">
                            <input type="radio" name="gender" value="female" data-toggle="radio" <% if (isFemale) { %> checked <% }%> >Female
                        </label>
                        <label class="radio">
                            <input type="radio" name="gender" value="male" data-toggle="radio" <% if (isMale) { %> checked <% }%> >Male
                        </label>
                    </div>
                </div>

                <div class="form-group"><strong>Date of Birth</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="dob" value="<%=user.getDate_of_birth()%>" />
                </div>

                <div class="form-group"><strong>Mobile number</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="mobile" value="<%=user.getMobile()%>" />
                </div>

                <div style="margin: 15px 0 10px 0;">
                    <button type="submit" class="btn btn-primary btn-embossed btn-block">Save changes</button>
                </div>

                <div>
                    <p class="gs-color-dclouds gs-text-md">
                        By clicking 'Save changes' button, your basic infomation details will be saved to the server of GoodStay, so make sure that you input the right information in the right field. And the value of "Date of Birth" field should follow the format "yyyy-mm-dd".
                    </p>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
<script type="text/javascript" src="https://cdn.staticfile.org/plupload/2.1.9/moxie.js"></script>
<script type="text/javascript" src="https://cdn.staticfile.org/plupload/2.1.9/plupload.dev.js"></script>
<script type="text/javascript" src="https://cdn.staticfile.org/qiniu-js-sdk/1.0.14-beta/qiniu.min.js"></script>
<script src="js/qiniuUserImg.js"></script>
<script>
    /*
	页面加载完毕 发起请求获取七牛token
	* 之后调用上传组件构造方法[qiniuUserImg.js]
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
        getTokenMessage();
    });
</script>
</body>
</html>
