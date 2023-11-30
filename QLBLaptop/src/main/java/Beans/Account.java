/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;



/**
 *
 * @author maiho
 */
@Entity(name ="Account")
@Table(name ="Account")
public class Account implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int IdAccount;
    @Column
    private String UserName;
    @Column
    private String Password;
    
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdNhanVien", nullable = true, foreignKey = @ForeignKey(name="fk_IdNhanVien_Account"),insertable=true, updatable=true)
    private Person_NhanVien nhanvien;
    
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdKhachHang", nullable = true, foreignKey = @ForeignKey(name="fk_IdKhachHang_Account"),insertable=true, updatable=true)
    private Person_KhachHang khachhang;

    public Account() {
    }
    
    public int getIdAccount() {
        return IdAccount;
    }

    public void setIdAccount(int IdAccount) {
        this.IdAccount = IdAccount;
    }

    public Person_NhanVien getNhanvien() {
        return nhanvien;
    }

    public void setNhanvien(Person_NhanVien nhanvien) {
        this.nhanvien = nhanvien;
    }

    public Person_KhachHang getKhachhang() {
        return khachhang;
    }

    public void setKhachhang(Person_KhachHang khachhang) {
        this.khachhang = khachhang;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    
}
