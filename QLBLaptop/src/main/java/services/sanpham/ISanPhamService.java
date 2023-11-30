package services.sanpham;

import Beans.SanPham;

import java.util.List;
import java.util.Optional;

public interface ISanPhamService {
    Optional<SanPham> getSanPhamById(String id);
    List<SanPham> getAllSanPham();
    SanPham addSanPham(SanPham sanPham);
    void updateSanPham(SanPham sanPham);
    void deleteSanPham(String id);
}
