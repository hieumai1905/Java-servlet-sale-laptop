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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author maiho
 */
@Entity(name = "image")
@Table(name = "image")
public class Image implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int IdImage;

    @Column
    private String URL;
    
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdPerson",foreignKey = @ForeignKey(name="fk_IdPerson_Image"), nullable = true, insertable=true, updatable=true)
    private Person person;
    
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "IdSanPham",foreignKey = @ForeignKey(name="fk_IdSanPham_Image"), nullable = true, insertable=true, updatable=true)
    private SanPham sanpham;

    public Image() {
    }

    public Image(Person person, SanPham sanpham,String URL) {
        this.URL = URL;
        this.person = person;
        this.sanpham = sanpham;
    }

    public Image(String URL, SanPham sanpham)
    {
        this.URL = URL;
        this.sanpham = sanpham;
    }

    public int getIdImage() {
        return IdImage;
    }

    public void setIdImage(int IdImage) {
        this.IdImage = IdImage;
    }

    public SanPham getSanpham() {
        return sanpham;
    }

    public void setSanpham(SanPham sanpham) {
        this.sanpham = sanpham;
    }
       
    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }
    
    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }
    
}
