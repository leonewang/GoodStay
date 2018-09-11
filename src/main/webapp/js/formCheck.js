function checkSignup() {
    var signup_name = $("#email");
    var nick_name = $("#username");
    var passwd = $("#password");
    var email_str = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
    var nick_str =  /^[\u4e00-\u9fa5a\w]{3,12}$/;
    var passwd_str =  /^[\u4e00-\u9fa5a\w]{6,15}$/;
    var email = email_str.test(signup_name.val());
    var nick = nick_str.test(nick_name.val());
    var password = passwd_str.test(passwd.val());

    if(!email) {
        addErrorMessage(signup_name,"Enter a right email!");
        return false;
    } else {
        removeErrorMessage(signup_name);

        if(!nick) {
            addErrorMessage(nick_name,"Take a good name!");
            return false;
        } else {
            removeErrorMessage(nick_name);

            if(!password) {
                addErrorMessage(passwd,"Too strong or too weak!");
                return false;
            } else {
                removeErrorMessage(passwd);
            }
        }
    }
}

function checkSignin() {
    var login_name = $("#login-name");
    var login_pass = $("#login-pass");

    if (login_name.val().length < 3) {
        addErrorMessage(login_name,"Wrong user name!");
        return false;
    } else {
        removeErrorMessage(login_name);

        if(login_pass.val().length < 6) {
            addErrorMessage(login_pass,"Is that your account?");
            return false;
        } else {
            removeErrorMessage(login_pass);
        }
    }
}

function addErrorMessage(node,message) {
    node.focus();
    node.addClass('error-message');
    node.next().addClass('error-message');
    $('#error-message').html(message);
    $('#error').addClass('show');
    setTimeout("$('#error').removeClass('show');", 2000);
}

function removeErrorMessage(node) {
    node.removeClass('error-message');
    node.next().removeClass('error-message');
}

function listErrorMessage(message) {
    var fourth_row = $('#fourth-row');
    fourth_row.removeClass('remove-error');
    fourth_row.addClass('error');
    fourth_row.children('small').html(message);
    setTimeout("$('#fourth-row').removeClass('error');$('#fourth-row').addClass('remove-error');", 2000);
    fourth_row.addClass('gs-visible');
    $("#list-error-title").addClass('gs-visible');
}
