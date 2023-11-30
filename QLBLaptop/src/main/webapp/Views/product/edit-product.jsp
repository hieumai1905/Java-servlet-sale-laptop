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
            <form class="form-horizontal form-material" action="/QLBLaptop/sanphams" method="post" onsubmit="return checkValidation()" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-6 col-xlg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group mb-4">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="id" value="${product.idSanPham}">
                                    <label class="col-md-12 p-0">Tên sản phẩm</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_name" name="product_name" value="${product.tenSanPham}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Thương hiệu</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="brand_name" name="brand_name" value="${product.thuongHieu}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Màu</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_color" name="product_color" value="${product.mau}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Series</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_series" name="product_series" value="${product.seriesLapTop}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Nhu cầu</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="demand" name="demand" value="${product.nhuCau}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Series CPU</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="series_cpu" name="series_cpu" value="${product.seriesCPU}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">CPU</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_cpu" name="product_cpu" value="${product.cpu}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Đồ hoạ</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_do_hoa" name="product_do_hoa" value="${product.doHoa}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Đồ hoạ rời</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_do_hoa_roi" name="product_do_hoa_roi" value="${product.doHoaRoi}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xlg-6 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">RAM</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_ram" name="product_ram" value="${product.ram}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Bộ nhớ</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_storage" name="product_storage" value="${product.boNho}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Màn hình</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_screen_size" name="product_screen_size" value="${product.ktManHinh}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Độ phân giải</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_phan_giai" name="product_phan_giai" value="${product.phanGiai}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Màn hình cảm ứng</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_mh_cam_ung" name="product_mh_cam_ung" value="${product.mhCamUng}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Khối lượng</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_weight" name="product_weight" value="${product.khoiLuong}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Giá nhập</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_price" name="product_price" min="0" value="${product.kho.giaNhap}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Giá bán</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" id="product_price_output" name="product_price_output" min="0" value="${product.kho.giaNhap}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Số lượng</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="number" id="product_quantity" name="product_quantity" min="0" max="1000000" value="${product.kho.soLuong}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Ảnh sản phẩm</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="file" id="product_image" name="product_image"
                                               class="form-control p-0 border-0" multiple></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-3">
                    <div class="col-sm-12">
                        <button class="btn btn-success">Cập nhật thông tin mới</button>
                    </div>
                </div>
            </form>
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