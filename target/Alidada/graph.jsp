<%@ page import="model.User" %>
<%@ page import="dao.DBDao" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Leone Wang">
    <title>Search as Graph | GoodStay</title>
    <!-- Bootstrap core CSS -->
    <!-- <link href="assets/flat-ui/css/bootstrap-responsive.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/assets/bootstrap.css">
    <link rel="stylesheet" href="css/assets/flat-ui.css">
    <link rel="stylesheet" href="css/doc.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <script type="text/javascript" src="js/assets/vis.min.js"></script>
    <link href="css/assets/vis.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #mynetwork {
            height: 500px;
            margin: 0 15px 30px 15px;
            border: 2px solid #bdc3c7;
            border-radius: 6px;
        }
    </style>
</head>
<body style="padding-top: 70px;">
<!-- /custom navbar -->
<%@include file="nav.jsp"%>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<div class="container">
    <div>
        <div><h4>Search as Graph</h4></div>

        <div>
            <form role="form" action="/SearchGraphServlet" method="post">
                <div class="form-group">
                    <strong>Username</strong>
                    <span class="fui-question-circle gs-color-greensea"></span>
                    <small class="gs-color-dsun gs-text-sm"> The user name is the unique identifier.</small>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Search by username"/>
                </div>

                <div class="form-group">
                    <div class="list-text"><strong>Gender</strong></div>
                    <div class="list-input">
                        <label class="radio">
                            <input type="radio" name="gender" value="female" data-toggle="radio">Female
                        </label>
                        <label class="radio">
                            <input type="radio" name="gender" value="male" data-toggle="radio">Male
                        </label>
                    </div>
                </div>

                <div class="form-group"><strong>Date of Birth</strong></div>
                <div class="form-group">
                    <input type="text" class="form-control" name="dob" placeholder="Search by birthday" />
                </div>

                <div style="margin: 15px 0 10px 0;">
                    <button class="btn btn-primary btn-embossed btn-block">Search</button>
                </div>
                <div>
                    <p class="gs-color-dclouds gs-text-md">
                        The search results will be shown below.
                    </p>
                </div>
            </form>
        </div>

        <div><h4>Search Result</h4></div>
        <div>
            <div class="row">
                <%
                    List v = new ArrayList();
                    List r = new ArrayList();
                    List w = new ArrayList();

                    for (User u: users) {
                        List<String> msgs = dbdao.getAllMsg(u.getUser_name());
                        List<String> friends = dbdao.getAllFriends(u.getUser_name());

                        for (String f: friends) {
                            List<String> friendsOfFriends = dbdao.getAllFriends(f);
                            for (String ff: friendsOfFriends) {
                                v.add(f);
                                r.add("friend of");
                                w.add(ff);
                            }
                        }

                        for (String msg: msgs) {
                            v.add(u.getUser_name());
                            r.add("posted");
                            w.add(msg);
                        }
                        for (String friend: friends) {
                            v.add(u.getUser_name());
                            r.add("friend of");
                            w.add(friend);
                        }
                    }
                %>
            </div>
            <div class="row">
                <div id="mynetwork"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // create an array with nodes
    var nodes = new vis.DataSet([
        <%
        Set<String> nodes = new java.util.HashSet();
        for(User u: users) {
            nodes.add(u.getUser_name());
        }

        for(int i = 0; i < v.size(); i++){
            nodes.add((String) v.get(i));
            nodes.add((String) w.get(i));
        }

        Iterator<String> it = nodes.iterator();
        while (it.hasNext()) {
            String n = it.next();
            System.out.println(n);

        %>
            {id: '<%=n%>', group:'user', label: '<%=n%>'},
        <%
        }
        %>
    ]);

    // create an array with edges
    var edges = new vis.DataSet([
        <%
        for(int i = 0; i < v.size(); i++) {
        %>
        {
            from: '<%=(String) v.get(i)%>',
            label:'<%=(String) r.get(i)%>',
            to: '<%=(String) w.get(i)%>'},
        <%
        }
        %>
    ]);

    // create a network
    var container = document.getElementById('mynetwork');

    // provide the data in the vis format
    var data = {
        nodes: nodes,
        edges: edges
    };
    var options = {
        edges:{
            font: {
                color: '#34495E',
                size: 14, // px
                background: '#fff',
                strokeWidth: 2, // px
                strokeColor: '#ffffff',
                align: 'horizontal',
                multi: false,
                vadjust: 0,
                bold: {
                    color: '#34495E',
                    size: 14, // px
                    vadjust: 0,
                    mod: 'bold'
                }
            },
            hoverWidth: 1.5,
        },
        groups: {
            user: {
                color: {
                    border: '#1abc9c',
                    background:'#1abc9c',
                    highlight: {
                        border: '#34495E',
                        background: '#34495E'
                    },
                    hover: {
                        border: '#34495E',
                        background: '#34495E'
                    }
                },
                border: '#1abc9c',
                borderWidth: 0,
                font: {
                    color: '#fff',
                    size: 14, // px
                    background: 'none',
                    strokeWidth: 0, // px
                    strokeColor: '#fff',
                    align: 'center',
                    multi: false,
                    vadjust: 0,
                    bold: {
                        color: '#16A085',
                        size: 14, // px
                        vadjust: 0,
                        mod: 'bold'
                    }
                }
            },
            message: {
                color: {
                    background:'#F39C12',
                    highlight: {
                        border: '#34495E',
                        background: '#34495E'
                    },
                    hover: {
                        border: '#34495E',
                        background: '#34495E'
                    }
                },
                borderWidth: 0,
                font: {
                    color: '#fff',
                    size: 14, // px
                    background: 'none',
                    strokeWidth: 0, // px
                    strokeColor: '#fff',
                    align: 'center',
                    multi: false,
                    vadjust: 0,
                    bold: {
                        color: '#E67E22',
                        size: 14, // px
                        vadjust: 0,
                        mod: 'bold'
                    }
                }
            },
            friend: {
                color: {
                    background:'#3498DB',
                    highlight: {
                        border: '#34495E',
                        background: '#34495E'
                    },
                    hover: {
                        border: '#34495E',
                        background: '#34495E'
                    }
                },
                borderWidth: 0,
                font: {
                    color: '#fff',
                    size: 14, // px
                    background: 'none',
                    strokeWidth: 0, // px
                    strokeColor: '#fff',
                    align: 'center',
                    multi: false,
                    vadjust: 0,
                    bold: {
                        color: '#2980B9',
                        size: 14, // px
                        vadjust: 0,
                        mod: 'bold'
                    }
                }
            }
        },
        autoResize: true,
        height: '100%',
        width: '100%',
        locale: 'en'
    };

    // initialize your network!
    var network = new vis.Network(container, data, options);
</script>
<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/flat-ui.min.js"></script>
<script src="js/assets/application.js"></script>
</body>
</html>
