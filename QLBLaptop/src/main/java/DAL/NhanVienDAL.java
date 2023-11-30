/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.Account;
import Beans.Image;
import Beans.Person;
import Beans.Person_KhachHang;
import Beans.Person_NhanVien;
import java.sql.Date;
import java.text.SimpleDateFormat;

import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class NhanVienDAL {
    Session session;
    public NhanVienDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadNhanVien() {
        List<Person_NhanVien> list;
        session.beginTransaction();
        list = session.createQuery("FROM NhanVien", Person_NhanVien.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public Person_NhanVien getNhanVien(String IdPerson)
    {
        session.beginTransaction();
        Person_NhanVien p = session.get(Person_NhanVien.class, IdPerson);
        session.getTransaction().commit();
        return p;
    }
    
    public boolean addNhanVien(Person_NhanVien nv)
    {
        session.beginTransaction();
        session.save(nv);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updateNhanVien(Person_NhanVien nv)
    {
        session.beginTransaction();
        session.saveOrUpdate(nv);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deleteNhanVien(String IdPerson)
    {
        session.beginTransaction();
        Person_NhanVien nv = session.get(Person_NhanVien.class, IdPerson);
        session.save(nv);
        session.getTransaction().commit();
        return true;
    }
    
    public static void main(String[] args) {
        NhanVienDAL dal = new  NhanVienDAL();
        List<Person_NhanVien> nv =dal.loadNhanVien();
        System.out.println("DAL.NhanVienDAL.main()"+nv);
         
    }
}
