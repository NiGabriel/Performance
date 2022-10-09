<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypackage.*"%>
<%@page import="superpack.*"%>
<%@page import="staffpack.*"%>
<%@page import="mypackage.user"%>
<% user user = (user) session.getAttribute("logStaff");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <style>

            #milestone,
            #assmilestone,
            #pendmilestone,
            #rankedmile,
            #uroles,
            #categories,
            #feedback,
            #staffprofile
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
                <li><i class="fa-solid fa-chart-pie"></i><a href="#dash" id="a1" onclick="w3_open1()">DASHBOARD</a></li>
                <li><i class="fa-brands fa-bandcamp"></i><a href="#milestone" id="a2" onclick="w3_open2()">ALL MILESTONES</a></li>
                <li><i class="fa-brands fa-amilia"></i><a href="#assmilestone" id="a3" onclick="w3_open3()">ASSIGNED MILESTONES</a></li>
                <li><i class="fa-brands fa-palfed"></i><a href="#pendmilestone" id="a4" onclick="w3_open4()">PENDING MILESTONES</a></li>
                <li><i class="fa-solid fa-ranking-star"></i><a href="#rankedmile" id="a5" onclick="w3_open5()">RANKED MILESTONES</a></li>
                <li><i class="fa-solid fa-comment"></i><a href="#feedback" id="a6" onclick="w3_open6()">FEEDBACK</a></li>                
                <li><i class="fa-brands fa-shirtsinbulk"></i><a href="#staffprofile" id="a8" onclick="w3_open7()">MY ACCOUNT PROFILE</a></li>
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
                            
                            <%if(user !=null){%>
                            <%= user.getStfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="stafflogout" style="color: white;">Log Out</a></button></h3>

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
                    if(user != null){

                    String qCo = "SELECT count( * ) FROM milestone where departmentname = '" + user.getStdepartmentname() + "'";
                    String qCo1 = "SELECT count( * ) FROM assignedmilestone where departmentname = '" + user.getStdepartmentname() + "' and staffname like '%" + user.getStfname() + "%' and staffname like '%" + user.getStlname() + "%'";
                    String qCo2 = "SELECT count( * ) FROM pendingmilestone where departmentname = '" + user.getStdepartmentname() + "' and staffname like '%" + user.getStfname() + "%' and staffname like '%" + user.getStlname() + "%'";
                    String qCo3 = "SELECT count( * ) FROM report where departmentname = '" + user.getStdepartmentname() + "' and staffname like '%" + user.getStfname() + "%' and staffname like '%" + user.getStlname() + "%'";
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
                        <i class="fa-brands fa-bandcamp"></i>
                        <div>
                            <h3><%=rsCo.getInt(1)%></h3>
                            <span>All Milestones</span>
                        </div>
                    </div>
                    <div class="val-box">
                        <i class="fa-brands fa-amilia"></i>
                        <div>
                            <h3><%=rsCo1.getInt(1)%></h3>
                            <span>Assigned</span>
                        </div>
                    </div>
                    <div class="val-box">
                        <i class="fa-brands fa-palfed"></i>
                        <div>
                            <h3><%=rsCo2.getInt(1)%></h3>
                            <span>Pending</span>
                        </div>
                    </div>
                    <div class="val-box">
                        <i class="fa-solid fa-ranking-star"></i>
                        <div>
                            <h3><%=rsCo3.getInt(1)%></h3>
                            <span>Ranked</span>
                        </div>
                    </div>
                </div>
                <div class="board">
                    <div class="card-header">
                        <h2> ALL STAFF MEMBERS IN DEPARTMENT</h2>
                    </div>
                    <table width="100%" id="tableUsers">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <td>All names</td>
                                <td>Username</td>
                                <td>Position</td>
                                <td>TELEPHONE</td>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int cn = 0;
                                Connection connecti = ConnectionPro.getConnection();
                                Statement stts = null;
                                ResultSet resus = null;
                                stts = connecti.createStatement();

                                String das;

                                das = "SELECT id, CONCAT(firstname,' ',lastname) AS firstname, email, username, position, telephone FROM staff where departmentname = '" + user.getStdepartmentname() + "' ORDER BY firstname";

                                resus = stts.executeQuery(das);
                                while (resus.next()) {
                            %>
                            <tr id="tusers">
                                <th class="people-des">
                                    <%
                                        cn += 1;
                                        out.print(cn);
                                    %>

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
            <!-- milestone section  -->
            <section id="milestone">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchMile" id="searchMile" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getStfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="stafflogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    milestone
                </h3>-->

                <!-- milestone form -->
                <div class="modal fade" id="addmilestone" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="MilestoneRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW MILESTONE</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">


                                        <textarea name="description" class="form-control" placeholder="Enter the milestone description"></textarea>
                                    </div>
                                    <div class="mb-3">

                                        <textarea name="target" class="form-control" placeholder="Enter the milestone target"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Milestone category</label>

                                        <select name="category" class="form-control">

                                            <%
                                                user x = new user();
                                                String name;
                                                try {

                                                    Connection con = ConnectionPro.getConnection();

                                                    PreparedStatement pst = con.prepareStatement("select catename from category where catename = 'KPI_assessment'");

                                                    ResultSet rs = pst.executeQuery();
                                                    while (rs.next()) {

                                                        name = rs.getString("catename");
                                                        x.setCatname(name);

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
                                        <label for="exampleFormControlInput1" class="form-label">Input date</label>
                                        <input type="datetime-local" class="form-control" name="idate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">End date</label>
                                        <input type="datetime-local" class="form-control" name="edate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Weight</label>
                                        <select name="weight" class="form-control">

                                            <%
                                                try {

                                                    Connection con = ConnectionPro.getConnection();

                                                    PreparedStatement pst = con.prepareStatement("select SUM(weight) AS weight from milestone where category ='" + x.getCatname() + "' and departmentname='" + user.getStdepartmentname() + "'");

                                                    ResultSet rs = pst.executeQuery();
                                                    while (rs.next()) {

                                                        String value = rs.getString("weight");
                                                        int w = Integer.parseInt(value);
                                                        for (int a = 1; a <= (100 - w); a++) {
                                            %>

                                            <option value="<%=a%>"><%=a%></option>
                                            <%
                                                        }
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

                <!-- Competency milestone form -->

                <div class="modal fade" id="compmilestone" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="MilestoneRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW MILESTONE</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3">


                                        <textarea name="description" class="form-control" placeholder="Enter the milestone description"></textarea>
                                    </div>
                                    <div class="mb-3">

                                        <textarea name="target" class="form-control" placeholder="Enter the milestone target"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Milestone category</label>

                                        <select name="category" class="form-control">

                                            <%
                                                user xmp = new user();
                                                String namemp;
                                                try {

                                                    Connection con = ConnectionPro.getConnection();

                                                    PreparedStatement pst = con.prepareStatement("select catename from category where catename ='Competency_assessment'");

                                                    ResultSet rs = pst.executeQuery();
                                                    while (rs.next()) {

                                                        namemp = rs.getString("catename");
                                                        x.setCatname(namemp);

                                            %>

                                            <option value="<%=namemp%>"><%=namemp%></option>
                                            <%
                                                    }

                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Input date</label>
                                        <input type="datetime-local" class="form-control" name="idate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">End date</label>
                                        <input type="datetime-local" class="form-control" name="edate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Weight</label>
                                        <select name="weight" class="form-control">

                                            <%
                                                try {

                                                    Connection con = ConnectionPro.getConnection();

                                                    PreparedStatement pst = con.prepareStatement("select SUM(weight) AS weight from milestone where category ='" + x.getCatname() + "' and departmentname='" + user.getStdepartmentname() + "'");

                                                    ResultSet rs = pst.executeQuery();
                                                    while (rs.next()) {

                                                        String value = rs.getString("weight");
                                                        int w = Integer.parseInt(value);
                                                        for (int a = 1; a <= (100 - w); a++) {
                                            %>

                                            <option value="<%=a%>"><%=a%></option>
                                            <%
                                                        }
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

                <!-- milestone card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR MILESTONES</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">

                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print(); return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableMilestone" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">NO</th>
                                    <th scope="col">Description</th>
                                    <!--<th scope="col">Target</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Input date</th>
                                    <th scope="col">End date</th>-->
                                    <th class="text-right">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 0;
                                    Connection cone = ConnectionPro.getConnection();
                                    Statement stat = null;
                                    ResultSet resu = null;
                                    stat = cone.createStatement();

                                    String da;

                                    da = "select * from milestone where departmentname='" + user.getStdepartmentname() + "' order by description asc";
                                    // dassign = "SELECT assignedmilestone.staffname FROM assignedmilestone RIGHT JOIN milestone ON assignedmilestone.target = milestone.target";

                                    resu = stat.executeQuery(da);

                                    while (resu.next()) {
                                %>
                                <tr id="tmilestone">

                                    <th scope="row">
                                        <%
                                            count += 1;
                                            out.print(count);
                                        %>

                                    </th>
                                    <td id="rmilestone">
                                        <h5><%=resu.getString(2)%></h5>

                                        <p><%=resu.getString(4)%> - (<%=resu.getString(5)%> - <%=resu.getString(6)%>) ~ <%=resu.getString(7)%>%</p>




                                    </td>


                                    <td class="text-right">

                                        <a href='StaffMileView?goal=<%=resu.getInt(1)%>' style="padding: 15px;"><i class="fa-solid fa-eye"></i></a>


                                    </td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="assmilestone">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchAssMile" id="searchAssMile" type="text" placeholder="Search">
                            </form>
                        </div>

                    </div>
                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getStfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="stafflogout" style="color: white;">Log Out</a></button></h3>

                    </div>

                </div>
                <!--<h3 class="i-nam">
                    Assigned milestone
                </h3>-->


                <!-- Assigned milestone form -->

                <!-- milestone card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR ASSIGNED MILESTONES</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">

                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print(); return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableAssMilestone" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">NO</th>
                                    <th scope="col">Description</th>
                                    <!--<th scope="col">Target</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Input date</th>
                                    <th scope="col">End date</th>-->
                                    <th class="text-right">STAFF</th>
                                    <th class="text-right">ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int c = 0, us = 1;
                                    Connection conass = ConnectionPro.getConnection();
                                    Statement statass, status = null;
                                    ResultSet resass, re = null;

                                    statass = conass.createStatement();

                                    String dass, dasus, valus;

                                    dass = "select * from assignedmilestone where departmentname='" + user.getStdepartmentname() + "' and staffname like '%" + user.getStfname() + "%' and staffname like '%" + user.getStlname() + "%' order by description asc";
                                    // dassign = "SELECT assignedmilestone.staffname FROM assignedmilestone RIGHT JOIN milestone ON assignedmilestone.target = milestone.target";

                                    resass = statass.executeQuery(dass);

                                    while (resass.next()) {
                                %>
                                <tr id="tassmilestone">

                                    <th scope="row">
                                        <%
                                            c += 1;
                                            out.print(c);
                                        %>

                                    </th>
                                    <td>
                                        <h5><%=resass.getString(2)%></h5>

                                        <p><%=resass.getString(4)%> - (<%=resass.getString(5)%> - <%=resass.getString(6)%>) ~ <%=resass.getString(7)%>%</p>






                                    </td>
                                    <td class="text-right">
                                        <%=resass.getString(8)%>

                                    <td class="text-right">
                                        <a href='FulfillMileMid?goal=<%=resass.getInt(1)%>' style="color: green;">Mid term</a>
                                        <a href='FulfillMileEnd?goal=<%=resass.getInt(1)%>'>End year</a>
                                    </td>
                                    <%}%>



                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="pendmilestone">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchPendMile" id="searchPendMile" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getStfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="stafflogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Pending milestone
                </h3>-->

                <!-- pending milestone form -->


                <!-- pending milestone card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR PENDING MILESTONES</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print(); return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tablePendMilestone" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">NO</th>
                                    <th scope="col">Description</th>
                                    <!--<th scope="col">Category</th>
                                    <th scope="col">Input date</th>
                                    <th scope="col">End date</th>-->
                                    <th class="text-right">STAFF</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int cp = 0;
                                    Connection conp = ConnectionPro.getConnection();
                                    Statement stap = null;
                                    ResultSet resp = null;
                                    stap = conp.createStatement();

                                    String dap;

                                    dap = "select * from pendingmilestone where departmentname='" + user.getStdepartmentname() + "' and staffname like '%" + user.getStfname() + "%' and staffname like '%" + user.getStlname() + "%' order by description asc";
                                    // dassign = "SELECT assignedmilestone.staffname FROM assignedmilestone RIGHT JOIN milestone ON assignedmilestone.target = milestone.target";

                                    resp = stap.executeQuery(dap);

                                    while (resp.next()) {
                                %>
                                <tr id="tpendmilestone">

                                    <th scope="row">
                                        <%
                                            cp += 1;
                                            out.print(cp);
                                        %>

                                    </th>
                                    <td>
                                        <h5><%=resp.getString(2)%></h5>

                                        <p><%=resp.getString(4)%> - (<%=resp.getString(7)%>) ~ <%=resp.getString(5)%>%</p>




                                    </td>
                                    <td class="text-right">
                                        <p><%=resp.getString(8)%></p>
                                    </td>



                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <section id="rankedmile">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchRankMile" id="searchRankMile" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getStfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="stafflogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Ranking milestone
                </h3>-->

                <!-- Ranking milestone form -->


                <!-- Ranking milestone card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR RANKED MILESTONES</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print(); return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableRankMilestone" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">NO</th>
                                    <th scope="col">Description</th>
                                    <!--<th scope="col">Category</th>
                                    <th scope="col">Input date</th>
                                    <th scope="col">End date</th>-->
                                    <th class="text-right">STAFF</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int crp = 0;
                                    Connection conrp = ConnectionPro.getConnection();
                                    Statement starp = null;
                                    ResultSet resrp = null;
                                    starp = conrp.createStatement();

                                    String darp;

                                    darp = "select * from report where departmentname='" + user.getStdepartmentname() + "' and staffname = '" + user.getStfname() + "_" + user.getStlname() + "' order by description asc";
                                    // dassign = "SELECT assignedmilestone.staffname FROM assignedmilestone RIGHT JOIN milestone ON assignedmilestone.target = milestone.target";

                                    resrp = starp.executeQuery(darp);

                                    while (resrp.next()) {
                                %>
                                <tr id="trankmilestone">

                                    <th scope="row">
                                        <%
                                            crp += 1;
                                            out.print(crp);
                                        %>

                                    </th>
                                    <td>
                                        <h5><%=resrp.getString(2)%></h5>

                                        <p><%=resrp.getString(4)%> - (<%=resrp.getString(9)%>) ~ <%=resrp.getString(12)%></p>




                                    </td>
                                    <td class="text-right">
                                        <p><%=resrp.getString(13)%></p>
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
                            <%= user.getStfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="stafflogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Feedback
                </h3>-->

                <!-- Feedback form -->
                <div class="modal fade" id="cfeedback" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="FeedbackRegisterServlet" method="post">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD NEW FEEDBACK</h5>
                                    <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
                                </div>
                                <div class="modal-body">

                                    <div class="mb-3" style="visibility: hidden;">
                                        <label for="exampleFormControlInput1" class="form-label">Staff name</label>
                                        <select name="stfname" class="form-control">

                                            <%
                                                user xmf = new user();
                                                String namemf;
                                                try {

                                                    Connection conf = ConnectionPro.getConnection();

                                                    PreparedStatement psf = conf.prepareStatement("select CONCAT(firstname,'_',lastname)AS firstname from staff where firstname = '" + user.getStfname() + "' and lastname = '" + user.getStlname() + "'");

                                                    ResultSet rsf = psf.executeQuery();
                                                    while (rsf.next()) {

                                                        namemf = rsf.getString("firstname");


                                            %>

                                            <option value="<%=namemf%>"><%=namemf%></option>
                                            <%
                                                    }

                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <div class="mb-3">


                                        <textarea name="description" class="form-control" placeholder="Enter the feedback description"></textarea>
                                    </div>
                                    <div class="mb-3" style="visibility: hidden;">
                                        <label for="exampleFormControlInput1" class="form-label">Department name</label>
                                        <select name="depname" class="form-control">

                                            <%
                                                
                                                String namedd;
                                                try {

                                                    Connection confd = ConnectionPro.getConnection();

                                                    PreparedStatement psfd = confd.prepareStatement("select dename from department where dename = '" + user.getStdepartmentname() + "'");

                                                    ResultSet rsfd = psfd.executeQuery();
                                                    while (rsfd.next()) {

                                                        namedd = rsfd.getString("dename");


                                            %>

                                            <option value="<%=namedd%>"><%=namedd%></option>
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
                <!-- Feedback card -->
                <div class="card">
                    <div class="card-header">
                        <h2> STAFF FEEDBACK</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">

                            <div class="col-md-12 text-right">
                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" data-bs-target="#cfeedback" style="width: 80px;"> ADD </button>
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
                                    <th class="text-right">Date</th>
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

                                    darf = "select * from feedback where staffname = '" + user.getStfname() + "_" + user.getStlname() + "' order by date asc";
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

                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
            <!-- Staff profile -->
            <section id="staffprofile">
                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                        <div class="searc">

                            <i class="fa-solid fa-magnifying-glass"></i>
                            <form action="" method="get">
                                <input name="searchstaff" id="searchstaff" type="text" placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="prof">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            <%if(user !=null){%>
                            <%= user.getStfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="stafflogout" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <!--<h3 class="i-nam">
                    Staff profile
                </h3>-->


                <!-- Staff card -->
                <div class="card">
                    <div class="card-header">
                        <h2> DATA FOR STAFF</h2>
                    </div>
                    <div class="card-body">

                        <div class="row">



                            <div class="col-md-12 text-right">

                                <button class="btn btn-success badge-pill" data-bs-toggle="modal" onclick="window.print(); return false;" style="width: 80px;"> PRINT </button>
                            </div>
                        </div>
                        <br>
                        <table class="table table-hover" id="tableStaff" >
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
                                    Connection condt = ConnectionPro.getConnection();
                                    Statement stdt = null;
                                    ResultSet resudt = null;
                                    stdt = condt.createStatement();

                                    String dadt;

                                    dadt = "select * from staff where departmentname='" + user.getStdepartmentname() + "' and firstname like '%" + user.getStfname() + "%' and lastname like '%" + user.getStlname() + "%' order by username asc";

                                    resudt = stdt.executeQuery(dadt);
                                    while (resudt.next()) {
                                %>
                                <tr id="staff">

                                    <th scope="row"><%=resudt.getString(2)%></th>
                                    <td><%=resudt.getString(4)%></td>
                                    <td><%=resudt.getString(5)%></td>
                                    <td><%=resudt.getString(6)%></td>

                                    <td class="text-right">

                                        <a href='StaffEdit?sidstaff=<%=resudt.getInt(1)%>' class="btn btn-primary badge-pill" style="width: 150px;">VIEW & EDIT</a>

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
                document.getElementById("milestone").style.display = "none";
                document.getElementById("assmilestone").style.display = "none";
                document.getElementById("pendmilestone").style.display = "none";
                document.getElementById("rankedmile").style.display = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("staffprofile").style.display = "none";
            }


            function w3_open2() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("milestone").style.display = "block";
                document.getElementById("assmilestone").style.display = "none";
                document.getElementById("pendmilestone").style.display = "none";
                document.getElementById("rankedmile").style.display = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("staffprofile").style.display = "none";
            }
            function w3_open3() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("milestone").style.display = "none";
                document.getElementById("assmilestone").style.display = "block";
                document.getElementById("pendmilestone").style.display = "none";
                document.getElementById("rankedmile").style.display = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("staffprofile").style.display = "none";
            }
            function w3_open4() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("milestone").style.display = "none";
                document.getElementById("assmilestone").style.display = "none";
                document.getElementById("pendmilestone").style.display = "block";
                document.getElementById("rankedmile").style.display = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("staffprofile").style.display = "none";
            }
            function w3_open5() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("milestone").style.display = "none";
                document.getElementById("assmilestone").style.display = "none";
                document.getElementById("pendmilestone").style.display = "none";
                document.getElementById("rankedmile").style.display = "block";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("staffprofile").style.display = "none";
            }
            function w3_open6() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("milestone").style.display = "none";
                document.getElementById("assmilestone").style.display = "none";
                document.getElementById("pendmilestone").style.display = "none";
                document.getElementById("rankedmile").style.display = "none";
                document.getElementById("feedback").style.display = "block";
                document.getElementById("staffprofile").style.display = "none";
            }
            function w3_open7() {
                document.getElementById("dash").style.display = "none";
                document.getElementById("milestone").style.display = "none";
                document.getElementById("assmilestone").style.display = "none";
                document.getElementById("pendmilestone").style.display = "none";
                document.getElementById("rankedmile").style.display = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("staffprofile").style.display = "block";
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
            var $rm = $('#tableMilestone #tmilestone');
            $('#searchMile').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rm.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>

        <script>
            var $rassm = $('#tableAssMilestone #tassmilestone');
            $('#searchAssMile').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rassm.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $rpendm = $('#tablePendMilestone #tpendmilestone');
            $('#searchPendMile').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rpendm.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();
            });
        </script>
        <script>
            var $rrankm = $('#tableRankMilestone #trankmilestone');
            $('#searchRankMile').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rrankm.show().filter(function () {
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
            var $rsup = $('#tableSuper #super');
            $('#searchsuper').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rsup.show().filter(function () {
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
            var $rsup = $('#tableStaff #staff');
            $('#searchstaff').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rsup.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return !~text.indexOf(val);
                }).hide();

            });
        </script>

    </body>
</html>
