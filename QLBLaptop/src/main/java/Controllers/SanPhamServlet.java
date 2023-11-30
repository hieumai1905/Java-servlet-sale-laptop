package Controllers;

import Beans.Image;
import Beans.Kho;
import Beans.SanPham;
import services.image.IImageService;
import services.image.ImageService;
import services.kho.IKhoService;
import services.kho.KhoService;
import services.sanpham.ISanPhamService;
import services.sanpham.SanPhamService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 1 MB
        maxFileSize = 1024 * 1024 * 1000, // 10 MB
        maxRequestSize = 1024 * 1024 * 1000 // 100 MB
)
@WebServlet(name = "SanPhamServlet", urlPatterns = "/sanphams")
public class SanPhamServlet extends HttpServlet {
    private ISanPhamService sanPhamService = null;
    private IKhoService khoService = null;

    private IImageService imageService = null;

    public void init() {
        sanPhamService = new SanPhamService();
        khoService = new KhoService();
        imageService = new ImageService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateProduct(req, resp);
                break;
            case "edit":
                showFormEditProduct(req, resp);
                break;
            case "detail":
                showDetailProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            default:
                showListProduct(req, resp);
                break;
        }
    }

    private void showDetailProduct(HttpServletRequest req, HttpServletResponse resp) {
        Optional<SanPham> sanPham = sanPhamService.getSanPhamById(req.getParameter("id"));
        if (sanPham.isEmpty()) {
            showListProduct(req, resp);
        } else {
            sanPham.get().setListImage(imageService.getImageByProductId(sanPham.get().getIdSanPham()));
            req.setAttribute("product", sanPham.get());
            redirectTo(req, resp, "Views/product/detail-product.jsp");
        }
    }

    private void showFormEditProduct(HttpServletRequest req, HttpServletResponse resp) {
        Optional<SanPham> sanPham = sanPhamService.getSanPhamById(req.getParameter("id"));
        if (sanPham.isEmpty()) {
            showListProduct(req, resp);
        } else {
            req.setAttribute("product", sanPham.get());
            redirectTo(req, resp, "Views/product/edit-product.jsp");
        }
    }

    private void showFormCreateProduct(HttpServletRequest req, HttpServletResponse resp) {
        redirectTo(req, resp, "Views/product/create-product.jsp");
    }

    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) {
        List<SanPham> products = sanPhamService.getAllSanPham();
        req.setAttribute("products", products);
        redirectTo(req, resp, "Views/product/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
            default:
                showListProduct(req, resp);
                break;
        }
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("product_name");
        String brand = (req.getParameter("brand_name")).toUpperCase();
        String color = req.getParameter("product_color");
        String series = req.getParameter("product_series");
        String demand = req.getParameter("demand");
        String seriesCPU = req.getParameter("series_cpu");
        String cpu = req.getParameter("product_cpu");
        String doHoa = req.getParameter("product_do_hoa");
        String doHoaRoi = req.getParameter("product_do_hoa_roi");
        String ram = req.getParameter("product_ram");
        String storage = req.getParameter("product_storage");
        String screenSize = req.getParameter("product_screen_size");
        String mhCamUng = req.getParameter("product_mh_cam_ung");
        String phanGiai = req.getParameter("product_phan_giai");
        String weight = req.getParameter("product_weight");
        SanPham sanPham = new SanPham(productName, brand, color, series, demand, seriesCPU, cpu, doHoa, doHoaRoi, ram, storage, screenSize, phanGiai, mhCamUng, weight);

        double priceInput = Double.parseDouble(req.getParameter("product_price"));
        double priceOutput = Double.parseDouble(req.getParameter("product_price_output"));
        int quantity = Integer.parseInt(req.getParameter("product_quantity"));
        Kho kho = new Kho(priceInput, priceOutput, quantity);
        khoService.addKho(kho);
        sanPham.setKho(kho);
        SanPham sanPhamAdd = sanPhamService.addSanPham(sanPham);
        if(sanPhamAdd != null) {
            List<Image> images = upLoadFile(brand, req, resp, sanPhamAdd);
            if(images != null) {
                sanPhamAdd.setListImage(images);
            }
            sanPhamService.updateSanPham(sanPhamAdd);
        }
        showListProduct(req, resp);
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idProduct = req.getParameter("id");
        Optional<SanPham> sanPhamCurrent = sanPhamService.getSanPhamById(idProduct);
        if (sanPhamCurrent.isEmpty()) {
            showListProduct(req, resp);
        } else {
            Kho khoCurrent = sanPhamCurrent.get().getKho();
            khoCurrent.setGiaNhap(Double.parseDouble(req.getParameter("product_price")));
            khoCurrent.setGiaBan(Double.parseDouble(req.getParameter("product_price_output")));
            khoCurrent.setSoLuong(Integer.parseInt(req.getParameter("product_quantity")));
            sanPhamCurrent.get().setTenSanPham(req.getParameter("product_name"));
            sanPhamCurrent.get().setThuongHieu(req.getParameter("brand_name").toUpperCase());
            sanPhamCurrent.get().setMau(req.getParameter("product_color"));
            sanPhamCurrent.get().setSeriesLapTop(req.getParameter("product_series"));
            sanPhamCurrent.get().setNhuCau(req.getParameter("demand"));
            sanPhamCurrent.get().setSeriesCPU(req.getParameter("series_cpu"));
            sanPhamCurrent.get().setCpu(req.getParameter("product_cpu"));
            sanPhamCurrent.get().setDoHoa(req.getParameter("product_do_hoa"));
            sanPhamCurrent.get().setDoHoaRoi(req.getParameter("product_do_hoa_roi"));
            sanPhamCurrent.get().setRam(req.getParameter("product_ram"));
            sanPhamCurrent.get().setBoNho(req.getParameter("product_storage"));
            sanPhamCurrent.get().setKtManHinh(req.getParameter("product_screen_size"));
            sanPhamCurrent.get().setPhanGiai(req.getParameter("product_phan_giai"));
            sanPhamCurrent.get().setMhCamUng(req.getParameter("product_mh_cam_ung"));
            sanPhamCurrent.get().setKhoiLuong(req.getParameter("product_weight"));
            khoCurrent.setSanPham(sanPhamCurrent.get());
            String brand = sanPhamCurrent.get().getThuongHieu().toUpperCase();
            List<Image> images = upLoadFile(brand, req, resp, sanPhamCurrent.get());
            if(images != null) {
                sanPhamCurrent.get().setListImage(images);
            }
            khoService.updateKho(khoCurrent);
            sanPhamService.updateSanPham(sanPhamCurrent.get());
            showListProduct(req, resp);
        }
    }

    private List<Image> upLoadFile(String brand, HttpServletRequest req, HttpServletResponse resp, SanPham sanPham) throws ServletException, IOException {
        List<Part> fileParts = req.getParts().stream()
                .filter(part -> "product_image".equals(part.getName()))
                .collect(Collectors.toList());

        if (fileParts.isEmpty() || fileParts.get(0).getSize() == 0) {
            System.out.println("Không có tệp tin nào được tải lên.");
            return null;
        }
        String absolutePath = "H:\\outsource\\salelaptop\\Java-servlet-sale-laptop\\QLBLaptop\\src\\main\\webapp\\Image\\Product\\" + brand;
        File directory = new File(absolutePath);
        if (!directory.exists()) {
            if (directory.mkdirs()) {
                System.out.println("Đã tạo thư mục " + brand);
            } else {
                System.out.println("Không thể tạo thư mục " + brand);
            }
        } else {
            System.out.println("Thư mục " + brand + " đã tồn tại");
        }
        Image image = null;
        List<Image> images = new ArrayList<>();
        for (Part filePart : fileParts) {
            String fileName = filePart.getSubmittedFileName();
            filePart.write(absolutePath + File.separator + fileName);
            image = new Image(fileName, sanPham);
            imageService.addImage(image);
            images.add(image);
        }
        return images;
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) {
        String idProduct = req.getParameter("id");
        Optional<SanPham> sanPham = sanPhamService.getSanPhamById(idProduct);
        if (sanPham.isEmpty()) {
            showListProduct(req, resp);
        } else {
            Kho kho = sanPham.get().getKho();
            khoService.deleteKho(kho.getIdKho());
            showListProduct(req, resp);
        }
    }

    private void redirectTo(HttpServletRequest request, HttpServletResponse response, String url) {
        try {
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
