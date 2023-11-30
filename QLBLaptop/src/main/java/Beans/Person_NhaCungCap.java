/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Beans;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author maiho
 */
@Entity(name ="NhaCungCap")
@Table(name ="NhaCungCap")
public class Person_NhaCungCap extends Person{
    @Column
    private String Loai;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = HoaDon.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdNhaCungCap", nullable = true,insertable=true, updatable=true)
    private List<HoaDon> listhoadon;
    
    @OneToMany (fetch = FetchType.LAZY, targetEntity = PhieuXuat.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdNhaCungCap", nullable = true,insertable=true, updatable=true)
    private List<Phieu> listphieu;

    public Person_NhaCungCap() {
    }

    public String getIdPerson() {
        return IdPerson;
    }

    public void setIdPerson() {
        String id ="NCC";
        int ten = 0 ;
        String[] loai = this.Loai.split(" ");
        for (String temp : loai) {
            ten += temp.charAt(0);
        }
        id+= String.valueOf(ten)+this.SDT;
        this.IdPerson = id.toUpperCase();
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

    public String getLoai() {
        return Loai;
    }

    public void setLoai(String Loai) {
        this.Loai = Loai;
    }
    
}
