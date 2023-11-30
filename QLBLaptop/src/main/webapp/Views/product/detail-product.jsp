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
                    <h4 class="page-title">Thông tin sản phẩm
                    </h4>
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="container-fluid">
            <div class="row">
                <!-- Column -->
                    <div class="col-lg-5 col-xlg-4 col-md-12">
                        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <c:forEach items="${product.listImage}" var="image" varStatus="loop">
                                    <div class="carousel-item ${loop.first ? 'active' : ''}" data-bs-interval="10000">
                                        <img src="../QLBLaptop/Image/Product/${product.thuongHieu}/${image.URL}" class="d-block w-100" alt="...">
                                    </div>
                                </c:forEach>
                            </div>
                            <button class="carousel-control-prev" style="border: none" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" style="border: none" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                </div>
                <!-- Column -->
                <!-- Column -->
                <div class="col-lg-7 col-xlg-8 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="col-lg-12 col-xlg-12 col-md-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p><strong>Mã sản phẩm:</strong> <span>${product.idSanPham}</span></p>
                                            <p><strong>Tên sản phẩm:</strong> ${product.tenSanPham}</p>
                                            <p><strong>Thương hiệu:</strong> ${product.thuongHieu}</p>
                                            <p><strong>Màu:</strong> ${product.mau}</p>
                                            <p><strong>Series:</strong> ${product.seriesLapTop}</p>
                                            <p><strong>Nhu cầu:</strong> ${product.nhuCau}</p>
                                            <p><strong>Series CPU:</strong> ${product.seriesCPU}</p>
                                            <p><strong>CPU:</strong> ${product.cpu}</p>
                                            <p><strong>Đồ hoạ:</strong> ${product.doHoa}</p>
                                            <p><strong>Đồ hoạ rời:</strong> ${product.doHoaRoi}</p>
                                            <p><strong>RAM:</strong> ${product.ram}</p>
                                            <p><strong>Bộ nhớ:</strong> ${product.boNho}</p>
                                            <p><strong>Màn hình:</strong> ${product.ktManHinh}</p>
                                            <p><strong>Độ phân giải:</strong> ${product.phanGiai}</p>
                                            <p><strong>Màn hình cảm ứng:</strong> ${product.mhCamUng}</p>
                                            <p><strong>Khối lượng:</strong> ${product.khoiLuong}</p>
                                            <p><strong>Giá nhập:</strong> <span id="giaNhap">${product.kho.giaNhap}</span></p>
                                            <p><strong>Giá bán:</strong> <span id="giaBan">${product.kho.giaBan}</span>
                                            </p>
                                            <p><strong>Số lượng:</strong> ${product.kho.soLuong}</p>
                                        </div>
                                        <script>
                                            var giaNhapValue = document.getElementById('giaNhap').textContent;
                                            var giaBanValue = document.getElementById('giaBan').textContent;
                                            var giaNhapFormatted = giaNhapValue.toString().replace('.0', '');
                                            var giaBanFormatted = giaBanValue.toString().replace('.0', '');
                                            document.getElementById('giaNhap').textContent = giaNhapFormatted + ' VND';
                                            document.getElementById('giaBan').textContent = giaBanFormatted + ' VND';
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Column -->
            </div>
        </div>
        <footer class="footer text-center"> 2021 © Ample Admin brought to you by <a
                href="https://www.wrappixel.com/">wrappixel.com</a>
        </footer>
    </div>
</div>
<script src="../QLBLaptop/static/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<script src="../QLBLaptop/static/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../QLBLaptop/static/js/app-style-switcher.js"></script>
<script src="../QLBLaptop/static/js/waves.js"></script>
<script src="../QLBLaptop/static/js/sidebarmenu.js"></script>
<script src="../QLBLaptop/static/js/custom.js"></script>
<script src="../QLBLaptop/static/js/product.js"></script>
</body>

</html>