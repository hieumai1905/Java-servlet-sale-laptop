/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.Person_KhachHang;
import Beans.Person_NhaCungCap;
import Beans.Person_NhanVien;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class NhaCungCapDAL {
    Session session;
    public NhaCungCapDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadKhachHang() {
        List<Person_NhaCungCap> list;
        session.beginTransaction();
        list = session.createQuery("FROM NhaCungCap ", Person_NhaCungCap.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public Person_NhaCungCap getNhaCungCap(String IdPerson)
    {
        session.beginTransaction();
        Person_NhaCungCap p = session.get(Person_NhaCungCap.class, IdPerson);
        session.getTransaction().commit();
        return p;
    }
    
    public boolean addNhaCungCap(Person_NhaCungCap ncc)
    {
        session.beginTransaction();
        session.save(ncc);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updateNhaCungCap(Person_NhaCungCap ncc)
    {
        session.beginTransaction();
        session.saveOrUpdate(ncc);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deleteNhaCungCap(String IdPerson)
    {
        session.beginTransaction();
        Person_NhaCungCap ncc = session.get(Person_NhaCungCap.class, IdPerson);
        session.save(ncc);
        session.getTransaction().commit();
        return true;
    }
    
    public static void main(String[] args) {
        try (Session session = HibernateUtils.getSessionFactory().openSession();) {
            Person_NhaCungCap ncc = new Person_NhaCungCap();
            session.beginTransaction();
            session.save(ncc);
            session.getTransaction().commit();        
        }catch(Throwable ex){
            System.err.println("Failed to create sessionFactory object."+ ex);
            throw new ExceptionInInitializerError(ex);
        }
         
    }
}
