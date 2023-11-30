package Beans;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Kho")
public class Kho implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdKho")
    private int idKho;

    @Column(name = "GiaNhap")
    private double giaNhap;

    @Column(name = "GiaBan")
    private double giaBan;

    @Column(name = "SoLuong")
    private int soLuong;

    @OneToOne(mappedBy = "kho", cascade = CascadeType.ALL)
    private SanPham sanPham;

    public Kho(double giaNhap, double giaBan, int soLuong) {
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.soLuong = soLuong;
    }
}