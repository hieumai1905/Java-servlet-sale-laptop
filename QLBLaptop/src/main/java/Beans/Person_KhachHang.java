/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import lombok.Data;

/**
 *
 * @author maiho
 */

@Entity(name ="KhachHang")
@Table(name ="KhachHang")
public class Person_KhachHang extends Person implements Serializable{
    @Column
    private String XepHang;
    @Column
    private double DiemTichLuy;
    
    @OneToOne(fetch = FetchType.LAZY, targetEntity = Account.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdAccount", nullable = false,insertable=true, updatable=true)
    private Account account;
        
    @OneToMany (fetch = FetchType.LAZY, targetEntity = DonHang.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdKhachHang", nullable = true,insertable=true, updatable=true)
    private List<DonHang> listdonhang;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = HoaDon.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdKhachHang", nullable = true,insertable=true, updatable=true)
    private List<HoaDon> listhoadon;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = PhieuXuat.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdKhachHang", nullable = true,insertable=true, updatable=true)
    private List<Phieu> listphieu;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = KhuyenMai.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdKhachHang", nullable = true,insertable=true, updatable=true)
    private List<KhuyenMai> listkhuyenmai;

    public Person_KhachHang() {
    }
    
    public String getIdPerson() {
        return IdPerson;
    }

    public void setIdPerson() {
        String id ="KH";
        int ten = 0 ;
        String[] hoten = this.Ten.split(" ");
        for (String temp : hoten) {
            ten += temp.charAt(0);
        }
        id+= String.valueOf(ten)+ this.SDT;
        this.IdPerson = id;
    }
    
    public List<KhuyenMai> getListkhuyenmai() {
        return listkhuyenmai;
    }

    public void setListkhuyenmai(List<KhuyenMai> listkhuyenmai) {
        this.listkhuyenmai = listkhuyenmai;
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

    public String getXepHang() {
        return XepHang;
    }

    public void setXepHang(String XepHang) {
        this.XepHang = XepHang;
    }

    public double getDiemTichLuy() {
        return DiemTichLuy;
    }

    public void setDiemTichLy(double DiemTichLuy) {
        this.DiemTichLuy = DiemTichLuy;
    }
    
}
