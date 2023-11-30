<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
          content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
          content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Ample Admin Lite Template by WrapPixel</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/"/>
    <link rel="icon" type="image/png" sizes="16x16" href="../QLBLaptop/static/plugins/images/favicon.png">
    <link href="../QLBLaptop/static/css/style.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>

<body>
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
            <div class="navbar-header" data-logobg="skin6">
                <a class="navbar-brand" href="dashboard.html">
                    <b class="logo-icon">
                        <img src="../QLBLaptop/static/plugins/images/logo-icon.png" alt="homepage"/>
                    </b>
                    <span class="logo-text">
                            <img src="../QLBLaptop/static/plugins/images/logo-text.png" alt="homepage"/>
                        </span>
                </a>
                <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                   href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                <ul class="navbar-nav d-none d-md-block d-lg-none">
                    <li class="nav-item">
                        <a class="nav-toggler nav-link waves-effect waves-light text-white"
                           href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="left-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="/QLBLaptop/sanphams"
                           aria-expanded="false">
                            <i class="fa fa-table" aria-hidden="true"></i>
                            <span class="hide-menu">Quản lý sản phẩm</span>
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
    </aside>
    <div class="page-wrapper">
        <div class="page-breadcrumb bg-white">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Quản lý sản phẩm
                    </h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <div class="d-md-flex">
                        <a href="/QLBLaptop/sanphams?action=create" target="_blank"
                           class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">Tạo
                            sản phẩm mới</a>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <div class="table-responsive">
                                <table class="table text-nowrap">
                                    <thead>
                                    <tr>
                                        <th class="border-top-0">ID</th>
                                        <th class="border-top-0">Tên</th>
                                        <th class="border-top-0">Thương hiệu</th>
                                        <th class="border-top-0">CPU</th>
                                        <th class="border-top-0">RAM</th>
                                        <th class="border-top-0">Bộ nhớ</th>
                                        <th class="border-top-0">Màn hình</th>
                                        <th class="border-top-0">Cân nặng</th>
                                        <th class="border-top-0">Action</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${products}" var="product">
                                        <tr>
                                            <td>${product.idSanPham}</td>
                                            <td>${product.tenSanPham}</td>
                                            <td>${product.thuongHieu}</td>
                                            <td>${product.cpu}</td>
                                            <td>${product.ram}</td>
                                            <td>${product.boNho}</td>
                                            <td>${product.ktManHinh}</td>
                                            <td>${product.khoiLuong}</td>
                                            <td>
                                                <a class="btn btn-primary"
                                                   href="/QLBLaptop/sanphams?action=detail&id=${product.idSanPham}">Detail</a>
                                                <a class="btn btn-warning btn-edit"
                                                   href="/QLBLaptop/sanphams?action=edit&id=${product.idSanPham}">Edit</a>
                                                <button class="btn btn-danger btn-delete text-white" class="btn-delete"
                                                        data-id="${product.idSanPham}">Delete
                                                </button>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer text-center"> 2021 © Ample Admin brought to you by <a
                    href="https://www.wrappixel.com/">wrappixel.com</a>
            </footer>
        </div>
    </div>
</div>
<script src="../QLBLaptop/static/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<script src="../QLBLaptop/static/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../QLBLaptop/static/js/app-style-switcher.js"></script>
<script src="../QLBLaptop/static/js/waves.js"></script>
<script src="../QLBLaptop/static/js/sidebarmenu.js"></script>
<script src="../QLBLaptop/static/js/custom.js"></script>
<script src="../QLBLaptop/static/js/delete-product.js"></script>
</body>

</html>