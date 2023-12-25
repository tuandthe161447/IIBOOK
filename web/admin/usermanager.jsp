<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@page import="Model.User" %>
<%
            User user = (User)session.getAttribute("user");
            if(user==null || !user.is_super()){
                response.sendRedirect("./Home");
            }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Manager</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="./admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="./admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="./admin/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="./admin/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="./admin/css/style.css" rel="stylesheet" type="text/css" />

        <style type="text/css">
            .left-aside{
                height: 1550px;
            }
        </style>
    </head>
    <body class="skin-black">
    <c:if test="${param['index']==null }">   
        <c:set var = "index" scope = "page" value = "1"/>
    </c:if>
    <c:if test="${param['index']!=null}">
        <c:set var = "index" scope = "page" value = "${param['index']}"/>
    </c:if>
    <!-- header logo: style can be found in header.less -->

    <jsp:include page="./header.jsp"/>
    <div class="wrapper row-offcanvas row-offcanvas-left" style="height: 100%;">
        <!-- Left side column. contains the logo and sidebar -->
        <jsp:include page="./aside.jsp"/>

        <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel">
                            <header class="panel-heading">
                                User Manager
                            </header>
                            <!-- <div class="box-header"> -->
                            <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                            <!-- </div> -->
                            <div class="panel-body table-responsive">
                                <div class="sliderList">
                                    <table class="table table-hover " id="tablepro">
                                        <thead>
                                            <tr style="cursor: pointer; font-size: 15px;  text-align: center;">
                                                <th style="width: 55px;">ID</th>
                                                <th>Name</th>
                                                <th>Username</th>
                                                <th>Gender</th>
                                                <th>Birthday</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Address</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int no=1;%>
                                        <c:forEach var="s" items="${users}">
                                            <tr>
                                                <td ><%=no++%></td>
                                                <td width="15%">${s.getName()}</td>
                                                <td style="width: 340px;">${s.getUsername()}</td>
                                                <td>${s.getGender()}</td>
                                                <td>${s.getDob()}</td>
                                                <td>${s.getEmail()}</td>
                                                <td>${s.getPhone()}</td>
                                                <td width="30%">${s.getAddress()}</td>
                                                <th><a class="btn btn-primary"><i class="fa fa-refresh"></i></a></th>
                                            </tr>
                                            <!-- Show detail modal -->
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
            </section><!-- /.content -->
            <div class="footer-main">
            </div>
        </aside><!-- /.right-side -->


    </div><!-- ./wrapper -->



    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#tablepro").DataTable({bFilter: false, bInfo: false, paging: false});
        });
    </script>
    <!-- Bootstrap -->
    <script src="./admin/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Director App -->
    <script src="./admin/js/Director/app.js" type="text/javascript"></script>
</body>
</html>