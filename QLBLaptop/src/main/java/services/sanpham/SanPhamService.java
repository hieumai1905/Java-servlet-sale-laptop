package services.sanpham;

import Beans.SanPham;
import DAL.SanPhamDAL;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class SanPhamService implements ISanPhamService {
    private SanPhamDAL sanPhamDAL;

    public SanPhamService() {
        sanPhamDAL = new SanPhamDAL();
    }

    @Override
    public Optional<SanPham> getSanPhamById(String id) {
        return Optional.ofNullable(sanPhamDAL.getSanPham(id));
    }

    @Override
    public List<SanPham> getAllSanPham() {
        List<SanPham> list = sanPhamDAL.loadSanPham();
        if(list != null)
            list.sort((o1, o2) -> o1.getIdSanPham().compareTo(o2.getIdSanPham()));
        return list;
    }

    @Override
    public SanPham addSanPham(SanPham sanPham) {
        return sanPhamDAL.addSanPham(sanPham);
    }

    @Override
    public void updateSanPham(SanPham sanPham) {
        sanPhamDAL.updateSanPham(sanPham);
    }

    @Override
    public void deleteSanPham(String id) {
        SanPham sanPham = sanPhamDAL.getSanPham(id);
        if (sanPham != null) {
            sanPhamDAL.deleteSanPham(sanPham);
        }
    }
}