/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;



import Beans.SanPham;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author caothanh
 */
public class HibernateUtils {
    
    private static final SessionFactory sessionFactory = buildSessionFactory();
 
    
 
    private static SessionFactory buildSessionFactory() {
        
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder() //
                .configure() // Load hibernate.cfg.xml from resource folder by default
                .build();
        Metadata metadata = new MetadataSources(serviceRegistry).getMetadataBuilder().build();
        return metadata.getSessionFactoryBuilder().build();
    
    }
 
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
 
    public static void close() {
        getSessionFactory().close();
    }
    
    
public static void main(String[] args) {
        // TODO code application logic here
        try (Session session = HibernateUtils.getSessionFactory().openSession();) {
            
            session.beginTransaction();
            List<SanPham> cus = session.createQuery("from SanPham").list();
            session.getTransaction().commit();    
            session.close();
            for(SanPham sp: cus){
                System.out.println("ID: "+ sp.getIdSanPham());
                System.out.println("Tên sản phẩm: "+ sp.getTenSanPham());
            }
            
   }
}
}
