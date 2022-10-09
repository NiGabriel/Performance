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
                #logs, #genpdf, #pr{
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
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"  crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="./js/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
        <script src="./js/jquery.dataTables.min.js"></script>
        <script src="./js/dataTables.bootstrap5.min.js"></script>
        <script src="./js/script.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
    </head>
    <body>
        <section id="menu">
            <div class="logo">
                <img src="img/bdflogo.jfif" alt="">
                <h2>BDF RWANDA</h2>
            </div>
            <%
                Connection conCo = ConnectionPro.getConnection();
                Connection conC = ConnectionPro.getConnection();
                Connection conCo2 = ConnectionPro.getConnection();
                Connection conCo3 = ConnectionPro.getConnection();
                Statement stCo, stC, stCo2, stCo3 = null;
                ResultSet rsCo, rsC = null;
                stCo = conCo.createStatement();
                stC = conC.createStatement();
                String n = request.getParameter("stname");

                //String qCo = "SELECT * FROM staff where firstname like '%" + n + "%' and lastname like '%" + n + "%'";
                String qCo = "SELECT SUBSTRING_INDEX((SUBSTRING_INDEX(staffname,'_',1)),'_',-1) AS firstname,SUBSTRING_INDEX((SUBSTRING_INDEX(staffname,'_',2)),'_',-1) AS lastname FROM report where staffname = '" + n + "'";
                rsCo = stCo.executeQuery(qCo);
                rsCo.next();

                String qC = "SELECT * from staff WHERE firstname = '" + rsCo.getString(1) + "' and lastname = '" + rsCo.getString(2) + "'";
                rsC = stC.executeQuery(qC);
                rsC.next();
            %>

        </section>
        <section id="interface">
            <section id="dash">


                <div class="nav">
                    <div class="n2">
                        <div class="">
                            <i id="menu-btn" class="fa-solid fa-bars"></i>
                        </div>
                    </div>

                    <div class="prof" id="logs">
                        <h3 style="padding: 7px; color: #594ef7;">  ACTIVE USER:
                            
                            <%if(user !=null){%>
                            <%= user.getHrfname()%>
                            <%}%>
                            <button class="btn btn-primary"><a href="LogoutServlet" style="color: white;">Log Out</a></button></h3>

                    </div>
                </div>
                <div class="row">

                    <div class="col-md-12 text-right" style="padding-top: 20px;">
                        <button class="btn btn-primary" data-bs-toggle="modal" onclick="window.print()" id="genpdf" style="width: 150px;"> GENERATE PDF </button>
                        <button class="btn btn-success" data-bs-toggle="modal" id="pr" style="width: 80px;"> <a href="humanr.jsp" style="color: white;">BACK</a> </button>
                    </div>
                </div>
                <br>

                <div class="card" id="tobeprinted">
                    <div class="card-header">
                        <h2> APPRAISAL RATING</h2>
                    </div>
                    <div class="items">

                        <table class="table table-hover">
                            <tr><th>NAMES:</th><td><h5 style="padding-left: 30px;"><%=rsCo.getString(1) + " " + rsCo.getString(2)%></h5></td></tr>
                            <tr><th>POSITION:</th><td><h5 style="padding-left: 30px;"><%=rsC.getString(6)%></h5></td></tr>
                            <tr><th>DEPARTMENT:</th><td><h5 style="padding-left: 30px;"><%=rsC.getString(7)%></h5></td></tr>
                            <tr><th>TELEPHONE:</th><td><h5 style="padding-left: 30px;"><%=rsC.getString(8)%></h5></td></tr>
                            <tr><th>EMAIL:</th><td><h5 style="padding-left: 30px;"><%=rsC.getString(9)%></h5></td></tr>
                        </table>
                    </div>
                    <div class="card-header">
                        <h2 style="text-align:center;">KPI ASSESSMENTS
                            <button class="btn" data-bs-toggle="modal" style="width: 150px;" id="btnkpi" onclick="hideShowkpi()">HIDE </button>
                        </h2>
                    </div>
                    <div class="card-body" id="kpi">
                        <table class="table table-hover" id="tableRating" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Target</th>
                                    <th scope="col">weight</th>
                                    <th scope="col">Av vs T.P</th>
                                    <th scope="col">Comments</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int ct = 0;
                                    Connection cone = ConnectionPro.getConnection();
                                    Statement stat, statt = null;
                                    ResultSet resu, resut = null;
                                    stat = cone.createStatement();
                                    statt = cone.createStatement();

                                    String dat, datt;

                                    dat = "select description, target, actualachieved, comment, weight, midyearrating, endyearrating, averageannualscore, totalpoint, rankdate FROM report where staffname = '" + n + "' and category = 'KPI_assessment' order by rankdate ";
                                    datt = "select SUM(weight), SUM(midyearrating), SUM(endyearrating), SUM(averageannualscore), SUM(totalpoint) FROM report where staffname = '" + n + "' and category = 'KPI_assessment' order by rankdate ";

                                    resu = stat.executeQuery(dat);
                                    resut = statt.executeQuery(datt);
                                    resut.next();

                                    while (resu.next()) {
                                %>
                                <tr id="trating">
                                    <th scope="row">
                                        <%
                                            ct += 1;
                                            out.print(ct);
                                        %>

                                    </th>

                                    <td scope="row">
                                        <h5><%=resu.getString(1)%></h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=resu.getString(2)%></h5>
                                        <p style="color:green;">Achieved: <%=resu.getString(3)%></p>
                                    </td>
                                    <td scope="row">
                                        <p style="color:green;">Weight:<%=resu.getString(5)%></p>
                                        <p style="color:green;">Mid: <%=resu.getString(6)%> - End:<%=resu.getString(7)%></p>
                                    </td>
                                    <td scope="row">
                                        <p style="color:green;">Average:<%=resu.getString(8)%></p>
                                        <p style="color:green;">Total point: <%=resu.getString(9)%></p>
                                    </td>
                                    <td scope="row">
                                        <p style="color:green;"><%=resu.getString(4)%></p>
                                    </td>


                                </tr>
                                <%}%>
                                <tr>
                                    <th scope="row">TOTAL</th>
                                    <td></td>
                                    <td></td>
                                    <td><p style="color:green;">Weight:<%=resut.getString(1)%></p> 
                                        <p style="color:green;">Mid Rate:<%=resut.getString(2)%></p>
                                        <p style="color:green;">End Rate:<%=resut.getString(3)%></p>
                                    </td>
                                    <td>
                                        <p style="color:green;">Average: <%=resut.getString(4)%></p>
                                        <p style="color:green;">T. point: <%=resut.getString(5)%></p>
                                    </td>
                                    <td></td>
                                </tr>

                            </tbody>

                        </table>

                    </div>
                    <div class="card-header">
                        <h2 style="text-align:center;">COMPETENCY ASSESSMENTS
                            <button class="btn" data-bs-toggle="modal" style="width: 150px;" id="btncomp" onclick="hideShowcomp()">HIDE</button>
                        </h2>
                    </div>
                    <div class="card-body" id="comp">
                        <table class="table table-hover" id="tableRating" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Target</th>
                                    <th scope="col">weight</th>
                                    <th scope="col">Av vs T.P</th>
                                    <th scope="col">Comments</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int cta = 0;
                                    Connection conea = ConnectionPro.getConnection();
                                    Statement stata, statta = null;
                                    ResultSet resua, resuta = null;
                                    stata = conea.createStatement();
                                    statta = conea.createStatement();

                                    String data, datta;

                                    data = "select description, target, actualachieved, comment, weight, midyearrating, endyearrating, averageannualscore, totalpoint, rankdate FROM report where staffname = '" + n + "' and category = 'Competency_assessment' order by rankdate ";
                                    datta = "select SUM(weight), SUM(midyearrating), SUM(endyearrating), SUM(averageannualscore), SUM(totalpoint) FROM report where staffname = '" + n + "' and category = 'Competency_assessment' order by rankdate ";

                                    resua = stata.executeQuery(data);
                                    resuta = statta.executeQuery(datta);
                                    resuta.next();

                                    while (resua.next()) {
                                %>
                                <tr id="trating">
                                    <th scope="row">
                                        <%
                                            cta += 1;
                                            out.print(cta);
                                        %>

                                    </th>

                                    <td scope="row">
                                        <h5><%=resua.getString(1)%></h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=resua.getString(2)%></h5>
                                        <p style="color:green;">Achieved: <%=resua.getString(3)%></p>
                                    </td>
                                    <td scope="row">
                                        <h5><%=resua.getString(5)%></h5>
                                        <p style="color:green;">Mid: <%=resua.getString(6)%> - End:<%=resua.getString(7)%></p>
                                    </td>
                                    <td scope="row">
                                        <p style="color:green;">Average:<%=resua.getString(8)%></p>
                                        <p style="color:green;">Total point: <%=resua.getString(9)%></p>
                                    </td>
                                    <td scope="row">
                                        <p style="color:green;"><%=resua.getString(4)%></p>
                                    </td>


                                </tr>
                                <%}%>
                                <tr>
                                    <th scope="row">TOTAL</th>
                                    <td></td>
                                    <td></td>
                                    <td><p style="color:green;">Weight:<%=resuta.getString(1)%></p> 
                                        <p style="color:green;">Mid Rate:<%=resuta.getString(2)%></p>
                                        <p style="color:green;">End Rate:<%=resuta.getString(3)%></p>
                                    </td>
                                    <td>
                                        <p style="color:green;">Average: <%=resuta.getString(4)%></p>
                                        <p style="color:green;">T. point: <%=resuta.getString(5)%></p>
                                    </td>
                                    <td></td>
                                </tr>

                            </tbody>

                        </table>

                    </div>
                    <div class="card-header">
                        <h2 style="text-align:center;">RATING CALCULATION
                            <button class="btn" data-bs-toggle="modal" style="width: 150px;" id="btnrate" onclick="hideShowrate()">HIDE</button>
                        </h2>
                    </div>
                    <div class="card-body" id="rate">
                        <table class="table table-hover" id="tableRating" >
                            <thead style="text-transform: uppercase;">
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">CATEGORY</th>
                                    <th scope="col">POINTS EARNED</th>
                                    <th scope="col">% OF RATING</th>
                                    <th scope="col">POINTS TOWARDS RATING</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int ctr = 0;
                                    double kr = 90, kc = 10;
                                    Connection coner = ConnectionPro.getConnection();
                                    Statement statr, stattr, st = null;
                                    ResultSet resur, resutr, rs = null;
                                    statr = coner.createStatement();
                                    stattr = coner.createStatement();
                                    st = coner.createStatement();

                                    String datr, dattr, d;

                                    datr = "select category, SUM(totalpoint) FROM report where staffname = '" + n + "' and category='KPI_assessment' group by category ";
                                    dattr = "select category, SUM(totalpoint) FROM report where staffname = '" + n + "' and category = 'Competency_assessment' group by category";
                                    d = "select SUM(totalpoint) FROM report where staffname = '" + n + "'";

                                    resur = statr.executeQuery(datr);
                                    resutr = stattr.executeQuery(dattr);
                                    rs = st.executeQuery(d);

                                    resutr.next();
                                    rs.next();

                                    while (resur.next()) {
                                %>
                                <tr id="trating">
                                    <th scope="row">
                                        <%
                                            ctr += 1;
                                            out.print(ctr);
                                        %>

                                    </th>

                                    <td scope="row">
                                        <h5><%=resur.getString(1)%></h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=resur.getDouble(2)%>%</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=kr%>%</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=(resur.getDouble(2) * kr) / 100%></h5>
                                    </td>

                                </tr>
                                <%}%>
                                <tr id="trating">
                                    <th scope="row">
                                        <%
                                            ctr += 1;
                                            out.print(ctr);
                                        %>

                                    </th>

                                    <td scope="row">
                                        <h5><%=resutr.getString(1)%></h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=resutr.getDouble(2)%>%</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=kc%>%</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=(resutr.getDouble(2) * kc) / 100%></h5>
                                    </td>

                                </tr>
                                <tr>
                                    <th scope="row" colspan="4">TOTAL</th>
                                    <td scope="row" >
                                        <h5 style="color:green;"><%=rs.getDouble(1)%></h5>
                                    </td>
                                </tr>


                            </tbody>

                        </table>
                                    <table class="table table-hover" style="background: linear-gradient(to top right, #33ccff 0%, #0066ff 100%);">
                            <%
                                String ach = "Achieved Excellence";
                                String exc = "Exceeded expectation";
                                String achexp = "Achieved expectation";
                                String un = "Unacceptable";
                            %>
                            <thead style="text-transform: uppercase;">

                                <tr>
                                    <th scope="col">
                                        Point scale
                                    </th>
                                    <th scope="col">
                                        Summary rating description
                                    </th>
                                    <th scope="col">
                                        Rating record
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td scope="row">
                                        <h5>4.6 or more</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=ach%></h5>
                                    </td>
                                    <td scope="row" rowspan="4" style="text-align: center; padding-top: 100px; text-transform: uppercase; color: #ffffff">
                                        <%
                                            if (rs.getDouble(1) >= 4.6) {
                                        %><h5 style="color:green;"><%=ach%></h5>
                                        <%
                                        } else if (rs.getDouble(1) >= 3.6 && rs.getDouble(1) <= 4.5) {
                                        %>
                                        <h5 style="color:green;"><%=exc%></h5>
                                        <%
                                        } else if (rs.getDouble(1) >= 2.5 && rs.getDouble(1) <= 3.5) {
                                        %>
                                        <h5 style="color:green;"><%=achexp%></h5>
                                        <%
                                        } else if (rs.getDouble(1) < 2.5) {
                                        %>
                                        <h5><%=un%></h5>
                                        <%
                                            }
                                        %>
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">
                                        <h5>3.6 - 4.5</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=exc%></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">
                                        <h5>2.5 - 3.5</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=achexp%></h5>
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row">
                                        <h5>< 2.5</h5>
                                    </td>
                                    <td scope="row">
                                        <h5><%=un%></h5>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </section>
        </section>
        <script>
            function hideShowkpi() {
                var x = document.getElementById("kpi");
                const btn = document.getElementById("btnkpi");
                if (x.style.display === "none") {
                    x.style.display = "block";
                    btn.innerText = "HIDE";
                } else {
                    x.style.display = "none";
                    btn.innerText = "SHOW";
                }
            }
            function hideShowcomp() {
                var x = document.getElementById("comp");
                const btnc = document.getElementById("btncomp");
                if (x.style.display === "none") {
                    x.style.display = "block";
                    btnc.innerText = "HIDE";
                } else {
                    x.style.display = "none";
                    btnc.innerText = "SHOW";
                }
            }
            function hideShowrate() {
                var x = document.getElementById("rate");
                const btnrate = document.getElementById("btnrate");
                if (x.style.display === "none") {
                    x.style.display = "block";
                    btnrate.innerText = "HIDE";
                } else {
                    x.style.display = "none";
                    btnrate.innerText = "SHOW";
                }
            }
            async function generatePDF(){
                document.getElementById("genpdf");
                var downloading = document.getElementById("tobeprinted");
                var doc = new jsPDF('pt','mm','a4');
                await html2canvas(downloading, {
                    //allowTaint: true,
                    //useCORS: true,
                    letterRendering:true,
                    dpi: 192,
                    scale:2,
                    logging:true
                }).then((canvas) => {
                    doc.addImage(canvas.toDataURL("image/png"), 'PNG',5 ,5, 250, 250);
                    
                })
                
                doc.save("Document.pdf");
                
            }
        </script>
    </body>
</html>
