/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.Account;
import Beans.Image;
import Beans.Person_KhachHang;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class KhachHangDAL {
    Session session;
    public KhachHangDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadKhachHang() {
        List<Person_KhachHang> list;
        session.beginTransaction();
        list = session.createQuery("FROM KhachHang ", Person_KhachHang.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public Person_KhachHang getKhachHang(String IdPerson)
    {
        session.beginTransaction();
        Person_KhachHang p = session.get(Person_KhachHang.class, IdPerson);
        session.getTransaction().commit();
        return p;
    }
    
    public boolean addKhachHang(Person_KhachHang kh)
    {
        session.beginTransaction();
        session.save(kh);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updateKhachHang(Person_KhachHang kh)
    {
        session.beginTransaction();
        session.saveOrUpdate(kh);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deleteKhachHang(String IdPerson)
    {
        session.beginTransaction();
        Person_KhachHang kh = session.get(Person_KhachHang.class, IdPerson);
        session.save(kh);
        session.getTransaction().commit();
        return true;
    }
    
    public static void main(String[] args) {
        try (Session session = HibernateUtils.getSessionFactory().openSession();) {
                      
            Person_KhachHang kh = new Person_KhachHang();
//            kh.setTen("Trần Văn A");
//            kh.setEmail("kh001@gmail.com");
//            kh.setDiaChi("123/32 Nguyễn Văn Tạo");
//            kh.setSDT("0247953213");
//            kh.setIdPerson();
//            
//            Image img = new Image();
//            img.setURL(kh.getIdPerson()+".jpg");
//            img.setPerson(kh);
//            
//            Account acc = new Account();
//            acc.setUserName("kh");
//            acc.setPassword("123");
//            acc.setKhachhang(kh);
//            
//            kh.setImage(img);
//            kh.setAccount(acc);
            
            session.beginTransaction();
            
            kh =session.get(Person_KhachHang.class, "KH2350247953213");
            System.out.println("DAL.KhachHangDAL.main()"+kh.getImage().getIdImage());
            Image img = session.get(Image.class, kh.getImage().getIdImage());
            img.setURL(kh.getIdPerson()+".png");
            session.update(kh);
            session.getTransaction().commit();        
        }catch(Throwable ex){
            System.err.println("Failed to create sessionFactory object."+ ex);
            throw new ExceptionInInitializerError(ex);
        }
         
    }
}
