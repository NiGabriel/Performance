<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypackage.*"%>
<%@page import="mypackage.user"%>
<% user user = (user) session.getAttribute("logAdmin");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <style>

            #supervisors,
            #staffs,
            #human,
            #departments,
            #positions,
            #uroles,
            #categories,
            #adminprofile
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
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BDF - PERFORMANCE APPRAISAL SYSTEM</title>

        <link rel="icon" href="img/bdflogo.jfif" type="image/x-icon">
        <link rel="stylesheet" href="css/style.css">

        <script src="https://kit.fontawesome.com/82c8618027.js" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="./js/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
        <script src="./js/jquery.dataTables.min.js"></script>
        <script src="./js/dataTables.bootstrap5.min.js"></script>
        <script src="./js/script.js"></script>
    </head>
    <body>
        <section id="menu">
            <div class="logo">
                <img src="img/bdflogo.jfif" alt="">
                <h2>BDF RWANDA</h2>
            </div>
            <div class="items">
                <li><i class="fa-solid fa-chart-pie"></i><a href="#dash" id="a1" onclick="w3_open1()">Dashboard</a></li>
                <li><i class="fa-brands fa-uikit"></i><a href="#supervisors" id="a2" onclick="w3_open2()">Supervisors</a></li>
                <li><i class="fa-solid fa-circle-user"></i><a href="#staffs" id="a3" onclick="w3_open3()">Staffs</a></li>
                <li><i class="fa-solid fa-clipboard-user"></i><a href="#human" id="a4" onclick="w3_open4()">Human resource</a></li>
                <li><i class="fa-solid fa-building"></i><a href="#departments" id="a5" onclick="w3_open5()">Departments</a></li>
                <li><i class="fa-solid fa-address-card"></i><a href="#positions" id="a6" onclick="w3_open6()">Positions</a></li>
                <li><i class="fa-solid fa-user"></i><a href="#uroles" id="a7" onclick="w3_open7()">Role of Users</a></li>
                <li><i class="fa-solid fa-address-card"></i><a href="#categories" id="a8" onclick="w3_open8()">Categories</a></li>
                <li><i class="fa-brands fa-accusoft"></i><a href="#adminprofile" id="a9" onclick="w3_open9()">Admin profile</a></li>
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

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

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
                    
                    if (user != null) {
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
                                <td>ID</td>
                                <td>All names</td>
                                <td>Username</td>
                                <td>Position</td>
                                <td>Role</td>

                            </tr>
                        </thead>
                        <tbody>
                            <%
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
                                <td class="people-des">
                                    <h5><%=resus.getInt(1)%></h5>

                                </td>
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
            <!-- Supervisors section  -->
            <section id="supervisors">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchSupervisor" id="searchSupervisor" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Supervisors
                </h3>-->

                <!-- supervisors form -->
                <div class="modal fade" id="addsupervisor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="SupervisorRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW SUPERVISOR</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Supervisor username</label>
                                        <input type="text" class="form-control" placeholder="enter the username of supervisor" name="suname" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor Password</label>
                                        <input type="password" class="form-control" placeholder="enter the password of supervisor" name="spass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor first name</label>
                                        <input type="text" class="form-control" placeholder="enter the first name of supervisor" name="sfname" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor last name</label>
                                        <input type="text" class="form-control" placeholder="enter the last name of supervisor" name="slname" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor position</label>

                                        <select name="position" class="form-control">

                                            <%

                                                try {

                                                    Connection con = ConnectionPro.getConnection();

                                                    PreparedStatement pst = con.prepareStatement("select pname from jobposition");

                                                    ResultSet rs = pst.executeQuery();
                                                    while (rs.next()) {
                                                        String name = rs.getString("pname");
                                            %>

                                            <option value="<%=name%>"><%=name%></option>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>


                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor telephone</label>
                                        <input type="text" class="form-control" placeholder="enter the supervisor's phone number" name="stel" pattern="^\d{10}$" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor Email</label>
                                        <input type="text" class="form-control" placeholder="enter email of supervisor" name="semail" pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$' required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor role</label>
                                        <select name="roln" class="form-control">

                                            <%
                                                try {

                                                    Connection conr = ConnectionPro.getConnection();

                                                    PreparedStatement pstr = conr.prepareStatement("select rolename from role");

                                                    ResultSet rsr = pstr.executeQuery();
                                                    while (rsr.next()) {
                                                        String namer = rsr.getString("rolename");
                                            %>

                                            <option value="<%=namer%>"><%=namer%></option>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Supervisor department</label>
                                        <select name="sdepartment" class="form-control">

                                            <%
                                                try {

                                                    Connection conr = ConnectionPro.getConnection();

                                                    PreparedStatement pstr = conr.prepareStatement("select dename from department");

                                                    ResultSet rsr = pstr.executeQuery();
                                                    while (rsr.next()) {
                                                        String namer = rsr.getString("dename");
                                            %>

                                            <option value="<%=namer%>"><%=namer%></option>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Supervisors card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR SUPERVISORS</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#addsupervisor" style="width: 80px;"> ADD </button>
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableSupervisor" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Username</th>
                                    <th scope="col">First name</th>
                                    <th scope="col">Last name</th>
                                    <th scope="col">Position</th>
                                    <th scope="col">Telephone</th>
                                    <th scope="col">Email</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection cone = ConnectionPro.getConnection();
                                    Statement stat = null;
                                    ResultSet resu = null;
                                    stat = cone.createStatement();

                                    String da;

                                    da = "select * from supervisor order by username asc";

                                    resu = stat.executeQuery(da);
                                    while (resu.next()) {
                                %>
                                <tr id="tsupervisor">

                                    <th scope="row"><%=resu.getString(2)%></th>
                                    <td><%=resu.getString(4)%></td>
                                    <td><%=resu.getString(5)%></td>
                                    <td><%=resu.getString(6)%></td>
                                    <td><%=resu.getString(7)%></td>
                                    <td><%=resu.getString(8)%></td>

                                    <td class="text-right">

                                        <a href='AdminSupervisorEdit?sidx=<%=resu.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                        <a href='SupervisorDeleteServlet?sid=<%=resu.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>

                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="staffs">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchstaff" id="searchStaff" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>

                </div>
                <!--<h3 class="i-nam">
                    Staff
                </h3>-->
                <!-- staff form -->
                <div class="modal fade" id="addstaff" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="StaffRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW STAFF</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Staff username</label>
                                        <input type="text" class="form-control" placeholder="enter the username of staff" name="stuname" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff Password</label>
                                        <input type="password" class="form-control" placeholder="enter the password of staff" name="stpass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff first name</label>
                                        <input type="text" class="form-control" placeholder="enter the first name of staff" name="stfname" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff last name</label>
                                        <input type="text" class="form-control" placeholder="enter the last name of staff" name="stlname" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff position</label>

                                        <select name="stposition" class="form-control">

                                            <%

                                                try {

                                                    Connection consta = ConnectionPro.getConnection();

                                                    PreparedStatement pststa = consta.prepareStatement("select pname from jobposition");

                                                    ResultSet rssta = pststa.executeQuery();
                                                    while (rssta.next()) {
                                                        String name = rssta.getString("pname");
                                            %>

                                            <option value="<%=name%>"><%=name%></option>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff department</label>

                                        <select name="stdepname" class="form-control">

                                            <%
                                                try {

                                                    Connection consta = ConnectionPro.getConnection();

                                                    PreparedStatement pststa = consta.prepareStatement("select dename from department");

                                                    ResultSet rssta = pststa.executeQuery();
                                                    while (rssta.next()) {
                                                        String name = rssta.getString("dename");
                                            %>

                                            <option value="<%=name%>"><%=name%></option>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>


                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff telephone</label>
                                        <input type="text" class="form-control" placeholder="enter the staff's phone number" name="sttel" pattern="^\d{10}$" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff Email</label>
                                        <input type="text" class="form-control" placeholder="enter email of staff" name="stemail" pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$' required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Staff role</label>
                                        <select name="stroln" class="form-control">

                                            <%
                                                try {

                                                    Connection conrsta = ConnectionPro.getConnection();

                                                    PreparedStatement pstrsta = conrsta.prepareStatement("select rolename from role");

                                                    ResultSet rsrsta = pstrsta.executeQuery();
                                                    while (rsrsta.next()) {
                                                        String namer = rsrsta.getString("rolename");
                                            %>

                                            <option value="<%=namer%>"><%=namer%></option>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Staffs card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR STAFF</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#addstaff" style="width: 80px;"> ADD </button>
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableStaff" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Username</th>
                                    <th scope="col">First name</th>
                                    <th scope="col">Last name</th>
                                    <th scope="col">Position</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Telephone</th>
                                    <th scope="col">Email</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection conest = ConnectionPro.getConnection();
                                    Statement statst = null;
                                    ResultSet resust = null;
                                    statst = conest.createStatement();

                                    String dast;

                                    dast = "select * from staff order by username asc";

                                    resust = statst.executeQuery(dast);
                                    while (resust.next()) {
                                %>
                                <tr id="tstaff">

                                    <th scope="row"><%=resust.getString(2)%></th>
                                    <td><%=resust.getString(4)%></td>
                                    <td><%=resust.getString(5)%></td>
                                    <td><%=resust.getString(6)%></td>
                                    <td><%=resust.getString(7)%></td>
                                    <td><%=resust.getString(8)%></td>
                                    <td><%=resust.getString(9)%></td>
                                    <td class="text-right">

                                        <a href='AdminStaffEdit?sidsta=<%=resust.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                        <a href='StaffDeleteServlet?sidsta=<%=resust.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>

                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="human">
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
                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    HR profile
                </h3>-->

                <div class="modal fade" id="addhuman" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="HrRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW HUMAN RESOURCE</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Username</label>
                                        <input type="text" class="form-control" placeholder="enter username" name="huname" required>
                                    </div>
                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Password</label>
                                        <input type="password" class="form-control" placeholder="enter password" name="hpass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                    </div>
                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">First name</label>
                                        <input type="text" class="form-control" placeholder="enter first name" name="hfname">
                                    </div>
                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Last name</label>
                                        <input type="text" class="form-control" placeholder="enter last name" name="hlname">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Telephone</label>
                                        <input type="text" class="form-control" placeholder="enter Telephone number" name="htel">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Email</label>
                                        <input type="text" class="form-control" placeholder="enter Email" name="hemail">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">role</label>
                                        <select name="hrole" class="form-control">

                                            <%

                                                try {

                                                    Connection conhr = ConnectionPro.getConnection();

                                                    PreparedStatement psthr = conhr.prepareStatement("select rolename from role");

                                                    ResultSet rshr = psthr.executeQuery();
                                                    while (rshr.next()) {
                                                        String nam = rshr.getString("rolename");
                                            %>

                                            <option value="<%=nam%>"><%=nam%></option>
                                            <%
                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



                <!-- Hr card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR HUMAN RESOURCE</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#addhuman" style="width: 80px;"> ADD </button>
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

                                    dadt = "select * from human_resource order by username asc";

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

                                        <a href='HREditAdmin?sidhr=<%=resudt.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>
                                        <a href='DeleteHr?sidhr=<%=resudt.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>
                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="departments">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchDep" id="searchDep" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof" id="logs">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Department
                </h3>-->
                <!-- department form -->
                <div class="modal fade" id="adddepartment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="DepRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW DEPARTMENT</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Department name</label>
                                        <input type="text" class="form-control" placeholder="enter department name" name="depname">
                                    </div>


                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Department card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR DEPARTMENT</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#adddepartment" style="width: 80px;"> ADD </button>
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableDepartment" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Department ID</th>
                                    <th scope="col">Department name</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection condp = ConnectionPro.getConnection();
                                    Statement statdp = null;
                                    ResultSet resudp = null;
                                    statdp  = condp.createStatement();

                                    String dadp;

                                    dadp  = "select * from department order by depid asc";

                                    resudp  = statdp.executeQuery(dadp);

                                    while (resudp.next () 
                                        ) {
                                %>
                                <tr id="department">

                                    <th scope="row"><%=resudp.getInt(1)%></th>
                                    <td><%=resudp.getString(2)%></td>

                                    <td class="text-right">

                                        <a href='AdminDepEdit?siddp=<%=resudp.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                        <a href='DepDeleteServlet?siddp=<%=resudp.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>

                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="positions">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchPos" id="searchPos" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Position
                </h3>-->
                <!-- Position form -->
                <div class="modal fade" id="addposition" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="PosRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW POSITION</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Position name</label>
                                        <input type="text" class="form-control"  placeholder="enter position name" name="pname">
                                    </div>


                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Position card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR POSITION</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#addposition" style="width: 80px;"> ADD </button>
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tablePosition" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Position ID</th>
                                    <th scope="col">Position name</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection conpos = ConnectionPro.getConnection();
                                    Statement statpos = null;
                                    ResultSet resupos = null;
                                    statpos  = conpos.createStatement();

                                    String dapos;

                                    dapos  = "select * from jobposition order by pid asc";

                                    resupos  = statpos.executeQuery(dapos);

                                    while (resupos.next () 
                                        ) {
                                %>
                                <tr id="position">

                                    <th scope="row"><%=resupos.getInt(1)%></th>
                                    <td><%=resupos.getString(2)%></td>

                                    <td class="text-right">

                                        <a href='AdminPosEdit?sidpos=<%=resupos.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                        <a href='PosDeleteServlet?sidpos=<%=resupos.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>

                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="uroles">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchrole" id="searchrole" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    User roles
                </h3>-->
                <!-- Roles form -->
                <div class="modal fade" id="addrole" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="RoleRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW ROLE</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Role name</label>
                                        <input type="text" class="form-control" placeholder="enter role name" name="rolename">
                                    </div>


                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Role card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR ROLE</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#addrole" style="width: 80px;"> ADD </button>
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableRole" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Role ID</th>
                                    <th scope="col">Role name</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection conrole = ConnectionPro.getConnection();
                                    Statement statrole = null;
                                    ResultSet resurole = null;
                                    statrole  = conrole.createStatement();

                                    String darole;

                                    darole  = "select * from role order by id asc";

                                    resurole  = statrole.executeQuery(darole);

                                    while (resurole.next () 
                                        ) {
                                %>
                                <tr id="role">

                                    <th scope="row"><%=resurole.getInt(1)%></th>
                                    <td><%=resurole.getString(2)%></td>

                                    <td class="text-right">

                                        <a href='AdminRoleEdit?sidrole=<%=resurole.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                        <a href='RoleDeleteServlet?sidrole=<%=resurole.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>

                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="categories">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchcategory" id="searchcategory" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof" id="logs">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    categories
                </h3>-->
                <!-- Categories form -->
                <div class="modal fade" id="addcategory" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="CateRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW ROLE</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Category name</label>
                                        <input type="text" class="form-control" placeholder="enter category name" name="catname">
                                    </div>


                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Categories card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR CATEGORIES</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#addcategory" style="width: 80px;"> ADD </button>
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableCate" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Category ID</th>
                                    <th scope="col">Category name</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection concate = ConnectionPro.getConnection();
                                    Statement statcate = null;
                                    ResultSet resucate = null;
                                    statcate  = concate.createStatement();

                                    String dacate;

                                    dacate  = "select * from category order by id asc";

                                    resucate  = statcate.executeQuery(dacate);

                                    while (resucate.next () 
                                        ) {
                                %>
                                <tr id="cate">

                                    <th scope="row"><%=resucate.getInt(1)%></th>
                                    <td><%=resucate.getString(2)%></td>

                                    <td class="text-right">

                                        <a href='AdminCateEdit?sidcate=<%=resucate.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                        <a href='CateDeleteServlet?sidcate=<%=resucate.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>

                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="adminprofile">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchadmin" id="searchadmin" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:

                            <%if (user != null) {%>
                            <%= user.getFirstname()%>
                            <%}%>

                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Admin profile
                </h3>-->
                <!-- Admin form -->
                <div class="modal fade" id="addadmin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="AdminRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW ADMIN</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Username</label>
                                        <input type="text" class="form-control" placeholder="enter username formed as email" name="auname" pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$' required>
                                    </div>
                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Password</label>
                                        <input type="password" class="form-control" placeholder="enter password" name="apass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                    </div>
                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">First name</label>
                                        <input type="text" class="form-control" placeholder="enter first name" name="afname">
                                    </div>
                                    <div class="mb-3">

                                        <label for="exampleFormControlInput1" class="form-label">Last name</label>
                                        <input type="text" class="form-control" placeholder="enter last name" name="alname">
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Admin position</label>
                                        <select name="aposition" class="form-control">

                                            <%

                                                
                                                    try {

                                                    Connection conadms = ConnectionPro.getConnection();

                                                    PreparedStatement pstadms = conadms.prepareStatement("select pname from jobposition");

                                                    ResultSet rsadms = pstadms.executeQuery();
                                                    while (rsadms.next()) {
                                                        String na = rsadms.getString("pname");
                                            %>

                                            <option value="<%=na%>"><%=na%></option>
                                            <%
                                                    }
                                                }
                                                catch (Exception e

                                                
                                                    ) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Admin role</label>
                                        <select name="arole" class="form-control">

                                            <%
                                                
                                                    try {

                                                    Connection conadm = ConnectionPro.getConnection();

                                                    PreparedStatement pstadm = conadm.prepareStatement("select rolename from role");

                                                    ResultSet rsadm = pstadm.executeQuery();
                                                    while (rsadm.next()) {
                                                        String nam = rsadm.getString("rolename");
                                            %>

                                            <option value="<%=nam%>"><%=nam%></option>
                                            <%
                                                    }
                                                }
                                                catch (Exception e

                                                
                                                    ) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Admin card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR ADMIN</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#addadmin" style="width: 80px;"> ADD </button>
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print();return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableAdmin" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">Username</th>
                                    <th scope="col">Firstname</th>
                                    <th scope="col">Lastname</th>
                                    <th scope="col">Position</th>
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection condta = ConnectionPro.getConnection();
                                    Statement stdta = null;
                                    ResultSet resudta = null;
                                    stdta  = condta.createStatement();

                                    String dadta;

                                    dadta  = "select * from admin where username= '"+user.getName()+"' order by username asc";

                                    resudta  = stdta.executeQuery(dadta);

                                    while (resudta.next() 
                                        ) {
                                %>
                                <tr id="admin">

                                    <th scope="row"><%=resudta.getString(2)%></th>
                                    <td><%=resudta.getString(4)%></td>
                                    <td><%=resudta.getString(5)%></td>
                                    <td><%=resudta.getString(6)%></td>

                                    <td class="text-right">

                                        <a href='AdminAdEdit?sidadm=<%=resudta.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

                                        <a href='AdmDeleteServlet?sidadm=<%=resudta.getInt(1)%>' class="btn btn-danger badge-pill" style="width: 80px;">DELETE</a>

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
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "none";

            }


            function w3_open2() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "block";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "none";

            }
            function w3_open3() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "block";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "none";

            }
            function w3_open4() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "block";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "none";

            }
            function w3_open5() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "block";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "none";

            }
            function w3_open6() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "block";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "none";

            }
            function w3_open7() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "block";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "none";

            }
            function w3_open8() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "block";
                document.getElementById("adminprofile").style.display = "none";

            }
            function w3_open9() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("supervisors").style.display = "none";
                document.getElementById("staffs").style.display = "none";
                document.getElementById("human").style.display = "none";
                document.getElementById("departments").style.display = "none";
                document.getElementById("positions").style.display = "none";
                document.getElementById("uroles").style.display = "none";
                document.getElementById("categories").style.display = "none";
                document.getElementById("adminprofile").style.display = "block";

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
            var $rows = $('#tableSupervisor #tsupervisor');
            $('#searchSupervisor').keyup(function () {
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
            var $radmin = $('#tableAdmin #admin');
            $('#searchadmin').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $radmin.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $rhr = $('#tableHr #hr');
            $('#searchhr').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                $rhr.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
    </body>
</html>
