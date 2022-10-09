

<%@page import="java.sql.*"%>
<%@page import="mypackage.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            *{
                padding:0;
                margin:0;
                box-sizing: border-box;
            }
            body{
                background:rgb(219 , 226, 226)
            }
            .row{
                background: white;
                border-radius: 30px;
                box-shadow: 12px 12px 22px grey;
            }
            img{
                border-top-left-radius: 30px;
                border-bottom-left-radius: 30px;
            }
            .btn1{
                border: none;
                outline: none;
                height: 50px;
                width: 100%;
                background-color: black;
                color: white;
                border-radius: 4px;
                font-weight: bold;
            }
            .btn1:hover{
                background: white;
                border: 1px solid;
                color: black;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PERFORMANCE APPRAISAL SYSTEM</title>

        <link rel="icon" href="img/bdflogo.jfif" type="image/x-icon">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"  crossorigin="anonymous">



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    </head>
    <body>

        <section class="Form my-4 mx-5">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-lg-5">
                        <img src="img/loginbg.png" class="img-fluid" alt="">
                    </div>
                    <div class="col-lg-7 px-5">
                        <h1 class='font-weight-bold py-3'>PERFORMANCE APPRAISAL SYSTEM</h1>
                        <h4>Sign into your account</h4>
                        <form action="LoginServlet" method="post">
                            <div class="form-row">
                                <div class="col-lg-7">
                                    Select role
                                    <select name="roln" class="form-control">

                                        <%

                                            try {

                                                Connection con = ConnectionPro.getConnection();

                                                PreparedStatement pst = con.prepareStatement("select rolename from role");

                                                ResultSet rs = pst.executeQuery();
                                                while (rs.next()) {
                                                    String name = rs.getString("rolename");
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
                            </div>
                            <div class="form-row">
                                <div class="col-lg-7">
                                    <input type="text" name="email" placeholder="Enter your username" class="form-control my-4">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-7">
                                    <input type="password" name="password" placeholder="********" class="form-control">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-lg-7">
                                    <button type="submit" class="btn1 mt-3 mb-5">Login</button>
                                </div>
                            </div>

                            <!--<a href="#">Forgot password?</a>
                            <p>Don't have an account? <a href='#'>Register here</a></p>-->
                        </form>
                        <div class="form-row">
                            <div class="col-lg-7">
                                <button class="btn" data-bs-toggle="modal" data-bs-target="#preset" style="width: 318px;"> Forgot password </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="preset" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="EmailSendingServlet" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">PASSWORD REMIND</h5>
                                <button type="button" class="btn-danger" data-bs-dismiss="modal" aria-label="Close">X</button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    Select role
                                    <select name="rolep" class="form-control">

                                        <%
                                            try {

                                                Connection conp = ConnectionPro.getConnection();

                                                PreparedStatement pstp = conp.prepareStatement("select rolename from role");

                                                ResultSet rsp = pstp.executeQuery();
                                                while (rsp.next()) {
                                                    String namep = rsp.getString("rolename");
                                        %>

                                        <option value="<%=namep%>"><%=namep%></option>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                out.print(e);
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Enter your email</label>
                                    <input type="text" class="form-control" name="emailres" pattern='^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$' required>
                                </div>
                                <div class="modal-footer">
                                    
                                    <button type="submit" class="btn btn-primary">Submit</button>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>