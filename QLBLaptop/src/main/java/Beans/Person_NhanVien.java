/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author maiho
 */
@Entity (name ="NhanVien")
@Table(name ="NhanVien")
public class Person_NhanVien extends Person{
    @Column
    private String BoPhan;
    @Column
    private String ChucVu;
    @Column
    @Temporal(value = TemporalType.DATE)
    private Date NgaySinh;

    @OneToOne(fetch = FetchType.LAZY, targetEntity = Account.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdAccount", nullable = true,insertable=true, updatable=true)
    private Account account;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = DonHang.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdNhanVien", nullable = true,insertable=true, updatable=true)
    private List<DonHang> listdonhang;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = HoaDon.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdNhanVien", nullable = true,insertable=true, updatable=true)
    private List<HoaDon> listhoadon;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = Phieu.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdNhanVien", nullable = true,insertable=true, updatable=true)
    private List<Phieu> listphieu;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = PhieuNhap.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdNhanVien", nullable = true,insertable=true, updatable=true)
    private List<PhieuNhap> listphieunhap;
    
    public Person_NhanVien() {
    }

    public String getIdPerson() {
        return IdPerson;
    }

    public void setIdPerson() {
        SimpleDateFormat sdfday = new SimpleDateFormat("dd");
        SimpleDateFormat sdfmonth = new SimpleDateFormat("MM");
        SimpleDateFormat sdfdayyear = new SimpleDateFormat("yyyy");
        String id = "";
        int ten =0;
        String bp ="";
        String cv ="";
        String[] bophan = this.BoPhan.split(" ");
        String[] chucvu = this.ChucVu.split(" ");
        String[] hoten = this.Ten.split(" ");
        for (String temp1 : hoten) {
            ten += temp1.charAt(0);
        }
        for (String temp2 : chucvu) {
            bp += temp2.charAt(0);
        }
        for (String temp3 : bophan) {
            cv += temp3.charAt(0);
        }
        id += cv.toUpperCase()+bp.toUpperCase()+String.valueOf(ten) + sdfday.format(this.NgaySinh)+ sdfmonth.format(this.NgaySinh)+ sdfdayyear.format(this.NgaySinh);
        this.IdPerson = id.toUpperCase();
    }
    
    public List<PhieuNhap> getListphieunhap() {
        return listphieunhap;
    }

    public void setListphieunhap(List<PhieuNhap> listphieunhap) {
        this.listphieunhap = listphieunhap;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public List<Phieu> getListphieu() {
        return listphieu;
    }

    public void setListphieu(List<Phieu> listphieu) {
        this.listphieu = listphieu;
    }

    public List<HoaDon> getListhoadon() {
        return listhoadon;
    }

    public void setListhoadon(List<HoaDon> listhoadon) {
        this.listhoadon = listhoadon;
    }

    public List<DonHang> getListdonhang() {
        return listdonhang;
    }

    public void setListdonhang(List<DonHang> listdonhang) {
        this.listdonhang = listdonhang;
    }

    public String getBoPhan() {
        return BoPhan;
    }

    public void setBoPhan(String BoPhan) {
        this.BoPhan = BoPhan;
    }

    public String getChucVu() {
        return ChucVu;
    }

    public void setChucVu(String ChucVu) {
        this.ChucVu = ChucVu;
    }

    public Date getNgaySinh() {
        return NgaySinh;
    }

    public void setNgaySinh(Date NgaySinh) {
        this.NgaySinh = NgaySinh;
    }
}
