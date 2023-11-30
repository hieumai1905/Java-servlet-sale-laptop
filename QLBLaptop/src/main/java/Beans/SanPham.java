package Beans;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "SanPham")
public class SanPham implements Serializable {
    @Id
    @Column(name = "IdSanPham")
    private String idSanPham;

    @Column(name = "TenSanPham")
    private String tenSanPham;

    @Column(name = "ThuongHieu")
    private String thuongHieu;

    @Column(name = "Mau")
    private String mau;

    @Column(name = "SeriesLapTop")
    private String seriesLapTop;

    @Column(name = "NhuCau")
    private String nhuCau;

    @Column(name = "SeriesCPU")
    private String seriesCPU;

    @Column(name = "CPU")
    private String cpu;

    @Column(name = "DoHoa")
    private String doHoa;

    @Column(name = "DoHoaRoi")
    private String doHoaRoi;

    @Column(name = "RAM")
    private String ram;

    @Column(name = "BoNho")
    private String boNho;

    @Column(name = "KTManHinh")
    private String ktManHinh;

    @Column(name = "PhanGiai")
    private String phanGiai;

    @Column(name = "MHCamUng")
    private String mhCamUng;

    @Column(name = "KhoiLuong")
    private String khoiLuong;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdSanPham", nullable = true, foreignKey = @ForeignKey(name="fk_IdSanPham_Image"))
    @ToString.Exclude
    private List<Image> listImage;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdKho", referencedColumnName = "IdKho", nullable = false)
    private Kho kho;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdSanPham", nullable = true, foreignKey = @ForeignKey(name="fk_IdSanPham_DonHangChiTiet"))
    @ToString.Exclude
    private List<DonHangChiTiet> listDonHangChiTiet;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdSanPham", nullable = true, foreignKey = @ForeignKey(name="fk_IdSanPham_HoaDonChiTiet"))
    @ToString.Exclude
    private List<HoaDonChiTiet> listHoaDonChiTiet;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdSanPham", nullable = true, foreignKey = @ForeignKey(name="fk_IdSanPham_PhieuChiTiet"))
    @ToString.Exclude
    private List<PhieuChiTiet> listPhieuChiTiet;

    public SanPham(String tenSanPham, String thuongHieu, String mau, String seriesLapTop, String nhuCau, String seriesCPU, String cpu, String doHoa, String doHoaRoi, String ram, String boNho, String ktManHinh, String phanGiai, String mhCamUng, String khoiLuong) {
        this.tenSanPham = tenSanPham;
        this.thuongHieu = thuongHieu;
        this.mau = mau;
        this.seriesLapTop = seriesLapTop;
        this.nhuCau = nhuCau;
        this.seriesCPU = seriesCPU;
        this.cpu = cpu;
        this.doHoa = doHoa;
        this.doHoaRoi = doHoaRoi;
        this.ram = ram;
        this.boNho = boNho;
        this.ktManHinh = ktManHinh;
        this.phanGiai = phanGiai;
        this.mhCamUng = mhCamUng;
        this.khoiLuong = khoiLuong;
    }
}