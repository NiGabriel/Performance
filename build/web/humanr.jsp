<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypackage.*"%>
<%@page import="mypackage.user"%>
<% user user = (user) session.getAttribute("logHuman");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <style>

            #rating,
            #feedback,
            #departments,
            #positions,
            #uroles,
            #categories,
            #hrprofile
            {
                display: none;
            }
            #interface .nav {
                display: flex;
                align-items: center;
                justify-content: space-between;
                background: #fff;
                padding: 15px 30px;
                border-bottom: 3px solid #594ef7;

                width: calc(100% - 0px);

            }
            #interface .nav .searc{
                display: flex;
                justify-content: flex-start;
                align-items: center;
                padding: 10px 14px;
                border: 1px solid #d7dbe6;
                border-radius: 4px;
            }
            #interface .nav .searc i{
                margin-right: 14px;
            }
            #interface .nav .searc input{
                border: none;
                outline: none;
                font-size: 14px;
            }
            #interface .nav .prof{
                display: flex;
                justify-content: flex-start;
                align-items: center;
            }
            #interface .nav .prof i{
                margin-right: 20px;
                font-size: 19px;
                font-weight: 400;
            }
            #interface .nav .prof img{
                width: 30px;
                height: 30px;
                object-fit: cover;
                border-radius: 50%;
            }

            .n2{
                display: flex;
                justify-content: flex-start;
                align-items: center;
            }
            .i-nam{
                color: #444a53;
                padding: 30px 30px 0;
                font-size: 24px;
                font-weight: 700;
                margin-top: 40px;
            }
            @media print{
                body *:not(#tobeprinted):not(#tobeprinted){

                }
                #item, #logs, #pr, #act, #actr, #searc{
                    visibility: hidden;
                }
                #tobeprinted{
                    position: absolute;
                    top: 0;
                    left: 0;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BDF - PERFORMANCE APPRAISAL SYSTEM</title>

        <link rel="icon" href="img/bdflogo.jfif" type="image/x-icon">
        <link rel="stylesheet" href="css/style.css">

        <script src="https://kit.fontawesome.com/82c8618027.js" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="./js/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
        <script src="./js/jquery.dataTables.min.js"></script>
        <script src="./js/dataTables.bootstrap5.min.js"></script>
        <script src="./js/script.js"></script>
    </head>
    <body>
        <%if(user != null){%>
        <section id="menu">
            <div class="logo">
                <img src="img/bdflogo.jfif" alt="">
                <h2>BDF RWANDA</h2>
            </div>
            <div class="items" id="item">
                <li><i class="fa-solid fa-chart-pie"></i><a href="#dash" id="a1" onclick="w3_open1()">Dashboard</a></li>
                <li><i class="fa-brands fa-uikit"></i><a href="#rating" id="a2" onclick="w3_open2()">Rating calculation</a></li>
                <li><i class="fa-solid fa-comment"></i><a href="#feedback" id="a3" onclick="w3_open3()">Feedback</a></li>
                <li><i class="fa-brands fa-accusoft"></i><a href="#hrprofile" id="a4" onclick="w3_open4()">HR profile</a></li>
            </div>
        </section>
        <section id="interface">
            <section id="dash">


                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="search" id="searchUsers" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof" id="logs">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getHrfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="hrlogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <h3 class="i-nam">
                    Dashboard
                </h3>
                <%
                    Connection conCo = ConnectionPro.getConnection();
                    Connection conCo1 = ConnectionPro.getConnection();
                    Connection conCo2 = ConnectionPro.getConnection();
                    Connection conCo3 = ConnectionPro.getConnection();
                    Statement stCo, stCo1, stCo2, stCo3 = null;
                    ResultSet rsCo, rsCo1, rsCo2, rsCo3 = null;
                    stCo = conCo.createStatement();
                    stCo1 = conCo1.createStatement();
                    stCo2 = conCo2.createStatement();
                    stCo3 = conCo3.createStatement();

                    String qCo = "SELECT count( * ) FROM staff";
                    String qCo1 = "SELECT count( * ) FROM supervisor";
                    String qCo2 = "SELECT count( * ) FROM department";
                    String qCo3 = "SELECT count( * ) FROM role";
                    rsCo = stCo.executeQuery(qCo);
                    rsCo1 = stCo1.executeQuery(qCo1);
                    rsCo2 = stCo2.executeQuery(qCo2);
                    rsCo3 = stCo3.executeQuery(qCo3);

                    rsCo.next();
                    rsCo1.next();
                    rsCo2.next();
                    rsCo3.next();
                %>
                <div class="values">
                    <div class="val-box">
                        <i class="fa-solid fa-users"></i>
                        <div>
                            <h3><%=rsCo.getInt(1)%></h3>
                            <span>Staff</span>
                        </div>
                    </div>
                    <div class="val-box">
                        <i class="fa-solid fa-section"></i>
                        <div>
                            <h3><%=rsCo1.getInt(1)%></h3>
                            <span>Supervisors</span>
                        </div>
                    </div>
                    <div class="val-box">
                        <i class="fa-brands fa-dashcube"></i>
                        <div>
                            <h3><%=rsCo2.getInt(1)%></h3>
                            <span>Department</span>
                        </div>
                    </div>
                    <div class="val-box">
                        <i class="fa-brands fa-ravelry"></i>
                        <div>
                            <h3><%=rsCo3.getInt(1)%></h3>
                            <span>Role</span>
                        </div>
                    </div>
                </div>
                <div class="board">
                    <div class="card-header">
                        <h2> ALL USERS AND THEIR ROLES</h2>
                    </div>
                    <table width="100%" id="tableUsers">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <td>All names</td>
                                <td>Username</td>
                                <td>Position</td>
                                <td>Role</td>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 0;
                                Connection connecti = ConnectionPro.getConnection();
                                Statement stts = null;
                                ResultSet resus = null;
                                stts = connecti.createStatement();

                                String das;

                                das = "SELECT id, CONCAT(firstname,' ',lastname) AS firstname, email, username,  position, role FROM supervisor UNION SELECT id, CONCAT(firstname,' ',lastname) AS firstname, email, username, position, role FROM staff UNION SELECT id, CONCAT(firstname,' ',lastname) AS firstname, username, username, position, role FROM admin ORDER BY role";

                                resus = stts.executeQuery(das);
                                while (resus.next()) {
                            %>
                            <tr id="tusers">
                                <th scope="row">
                                    <%
                                        count += 1;
                                        out.print(count);
                                    %>

                                </th>
                                <td class="people">
                                    <!--<img src="" alt="">-->
                                    <div class="people-de">
                                        <h5><%=resus.getString(2)%></h5>
                                        <p><%=resus.getString(3)%></p>
                                    </div>
                                </td>
                                <td class="people-des">
                                    <h5><%=resus.getString(4)%></h5>

                                </td>

                                <td class="role">
                                    <p><%=resus.getString(5)%></p>
                                </td>
                                <td class="role">
                                    <p><%=resus.getString(6)%></p>
                                </td>

                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- Human resource section  -->
            <section id="rating">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc" id="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchRating" id="searchRating" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof" id="logs">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getHrfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="hrlogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>

                <!-- Human resource card -->
                <div class="card" id="tobeprinted">
                    <div class="card-header">
                        <h2> RATING CALCULATION</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">

                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" id="pr" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableRating" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Names</th>
                                    <th class="text-right" id="act">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int ct = 0;
                                    Connection cone = ConnectionPro.getConnection();
                                    Statement stat = null;
                                    ResultSet resu = null;
                                    stat = cone.createStatement();

                                    String da, daa, dat;

                                    //da = "select * from report group by staffname order by goal asc";
                                    daa = "select goal, staffname, SUM(midyearrating + endyearrating) FROM report where category = 'KPI_assessment' group by staffname";
                                    dat = "select goal, staffname, SUM(CASE WHEN category = 'KPI_assessment' THEN midyearrating + endyearrating END)kpi,SUM(CASE WHEN category = 'Competency_assessment' THEN midyearrating + endyearrating END)competency FROM report group by staffname ";

                                    resu = stat.executeQuery(dat);
                                    while (resu.next()) {
                                %>
                                <tr id="trating">
                                    <th scope="row">
                                        <%
                                            ct += 1;
                                            out.print(ct);
                                        %>

                                    </th>

                                    <th scope="row">
                                        <h5><%=resu.getString(2)%></h5>
                                        <p style="color:green;">KPI assessment: <%=resu.getString(3)%> % - Competency assessment: <%=resu.getString(4)%> %</p>
                                    </th>

                                    <td class="text-right" id="actr">

                                        <a href='Appraisal.jsp?stname=<%=resu.getString(2)%>'  style="width: 150px;">VIEW APPRAISAL</a>



                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="feedback">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchFeedback" id="searchFeedback" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getHrfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="hrlogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Feedback
                </h3>-->

                <!-- Feedback card -->
                <div class="card">
                    <div class="card-header">
                        <h2> STAFF FEEDBACK</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">

                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print(); return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tablefeedback" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">NO</th>
                                    <th scope="col">Staffname</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Department</th>
                                    <th class="text-right">ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int crf = 0;
                                    Connection conrf = ConnectionPro.getConnection();
                                    Statement starf = null;
                                    ResultSet resrf = null;
                                    starf = conrf.createStatement();

                                    String darf;

                                    darf = "select * from feedback order by date asc";
                                    // dassign = "SELECT assignedmilestone.staffname FROM assignedmilestone RIGHT JOIN milestone ON assignedmilestone.target = milestone.target";

                                    resrf = starf.executeQuery(darf);

                                    while (resrf.next()) {
                                %>
                                <tr id="tfeedback">

                                    <th scope="row">
                                        <%
                                            crf += 1;
                                            out.print(crf);
                                        %>

                                    </th>
                                    <td>
                                        <h5><%=resrf.getString(2)%></h5>
                                    </td>
                                    <td>
                                        <h5><%=resrf.getString(3)%></h5>
                                    </td>
                                    <td class="text-right">
                                        <p><%=resrf.getString(4)%></p>
                                    </td>
                                    <td class="text-right">
                                        <p><%=resrf.getString(5)%></p>
                                    </td>
                                    <td class="text-right">
                                        <a href='DeleteFeed?fid=<%=resrf.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>
                                    </td>

                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            
            <section id="hrprofile">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchhr" id="searchhr" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof" id="logs">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getHrfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="hrlogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    HR profile
                </h3>-->
                

                <!-- Admin card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR HUMAN RESOURCE</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableHr" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Username</th>
                                    <th scope="col">Firstname</th>
                                    <th scope="col">Lastname</th>
                                    <th scope="col">Telephone</th>
                                    <th scope="col">Email</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection condt = ConnectionPro.getConnection();
                                    Statement stdt = null;
                                    ResultSet resudt = null;
                                    stdt = condt.createStatement();

                                    String dadt;

                                    dadt = "select * from human_resource where firstname ='"+user.getHrfname()+"' and lastname='"+user.getHrlname()+"' order by username asc";

                                    resudt = stdt.executeQuery(dadt);
                                    while (resudt.next()) {
                                %>
                                <tr id="hr">

                                    <th scope="row"><%=resudt.getString(2)%></th>
                                    <td><%=resudt.getString(4)%></td>
                                    <td><%=resudt.getString(5)%></td>
                                    <td><%=resudt.getString(6)%></td>
                                    <td><%=resudt.getString(7)%></td>

                                    <td class="text-right">

                                        <a href='HREdit?sidhr=<%=resudt.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                    </td>
                                </tr>
                                <%}}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </section>


        <script>
            $('#menu-btn').click(function () {
                $('#menu').toggleClass("active");
            })
        </script>
        <script>
            function updateUserStatus() {
                jQuery.ajax({
                    url: 'update_user_status/update_admin_status.java',
                    success: function () {

                    }
                });
            }
            setInterval(function () {
                updateUserStatus();
            }, 5000);
        </script>
        <script>
            function w3_open1() {
                document.getElementById("dash").style.display = "block";
                document.getElementById("rating").style.display = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("hrprofile").style.display = "none";

            }


            function w3_open2() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("rating").style.display = "block";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("hrprofile").style.display = "none";

            }
            function w3_open3() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("rating").style.display = "none";
                document.getElementById("feedback").style.display = "block";
                document.getElementById("hrprofile").style.display = "none";

            }
            function w3_open4() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("rating").style.display = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("hrprofile").style.display = "block";

            }

        </script>
        <script>
            var $r = $('#tableUsers #tusers');
            $('#searchUsers').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $r.show().filter(function () {
                    var t = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~t.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $rows = $('#tableRating #trating');
            $('#searchRating').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $ros = $('#tableStaff #tstaff');
            $('#searchStaff').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $ros.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $ro = $('#tableDepartment #department');
            $('#searchDep').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $ro.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $ropos = $('#tablePosition #position');
            $('#searchPos').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $ropos.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $role = $('#tableRole #role');
            $('#searchrole').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $role.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $cate = $('#tableCate #cate');
            $('#searchcategory').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $cate.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $rsfd = $('#tablefeedback #tfeedback');
            $('#searchFeedback').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rsfd.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();

            });
        </script>
        <script>
            var $radmin = $('#tableHr #hr');
            $('#searchhr').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $radmin.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
    </body>
</html>
