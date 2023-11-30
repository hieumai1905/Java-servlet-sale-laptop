/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;


import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author maiho
 */
@Entity(name ="KhuyenMai")
@Table(name ="KhuyenMai")
public class KhuyenMai implements Serializable {
    @Id
    private String IdKhuyenMai;
    @Column 
    private String KhuyenMai;
    @Column
    private String NoiDung;
    @Column
    private String Loai;
    @Column
    @Temporal(value = TemporalType.DATE)
    private Date NgayBatDau;
    @Column
    @Temporal(value = TemporalType.DATE)
    private Date NgayKetThuc;
    @Column
    private String TrangThai;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdSanPham",foreignKey = @ForeignKey(name="fk_IdSanPham_KhuyenMai"), nullable = true, insertable=true, updatable=true)
    private SanPham sanpham;
    
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdKhachHang",foreignKey = @ForeignKey(name="fk_IdKhachHang_KhuyenMai"), nullable = true, insertable=true, updatable=true)
    private Person_KhachHang khachhang;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = DonHang.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdKhuyenMai", nullable = true,insertable=true, updatable=true)
    private List<DonHang> listdonhang;

    public KhuyenMai() {
    }

    public List<DonHang> getListdonhang() {
        return listdonhang;
    }

    public void setListdonhang(List<DonHang> listdonhang) {
        this.listdonhang = listdonhang;
    }    

    public String getKhuyenMai() {
        return KhuyenMai;
    }

    public void setKhuyenMai(String KhuyenMai) {
        this.KhuyenMai = KhuyenMai;
    }

    public Person_KhachHang getKhachhang() {
        return khachhang;
    }

    public void setKhachhang(Person_KhachHang khachhang) {
        this.khachhang = khachhang;
    }
    
    public SanPham getSanpham() {
        return sanpham;
    }

    public void setSanpham(SanPham sanpham) {
        this.sanpham = sanpham;
    }
    
    
    public String getIdKhuyenMai() {
        return IdKhuyenMai;
    }

    public void setIdKhuyenMai(String IdKhuyenMai) {
        this.IdKhuyenMai = IdKhuyenMai;
    }

    public String getNoiDung() {
        return NoiDung;
    }

    public void setNoiDung(String NoiDung) {
        this.NoiDung = NoiDung;
    }

    public String getLoai() {
        return Loai;
    }

    public void setLoai(String Loai) {
        this.Loai = Loai;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String TrangThai) {
        this.TrangThai = TrangThai;
    }

    public Date getNgayBatDau() {
        return NgayBatDau;
    }

    public void setNgayBatDau(Date NgayBatDau) {
        this.NgayBatDau = NgayBatDau;
    }

    public Date getNgayKetThuc() {
        return NgayKetThuc;
    }

    public void setNgayKetThuc(Date NgayKetThuc) {
        this.NgayKetThuc = NgayKetThuc;
    }
    
}
