/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.DonHang;
import Beans.Image;
import Beans.DonHang;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class DonHangDAL {
    Session session;
    public DonHangDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadDonHang() {
        List<DonHang> list;
        session.beginTransaction();
        list = session.createQuery("FROM DonHang ", DonHang.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public DonHang getDonHang(String IdDonHang)
    {
        session.beginTransaction();
        DonHang dh = session.get(DonHang.class, IdDonHang);
        session.getTransaction().commit();
        return dh;
    }
    
    public boolean addDonHang(DonHang dh)
    {
        dh.setIdDonHang(this.SetIdDonHang());
        session.beginTransaction();
        session.save(dh);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updateDonHang(DonHang dh)
    {
        session.beginTransaction();
        session.saveOrUpdate(dh);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deleteDonHang(String IdDonHang)
    {
        session.beginTransaction();
        DonHang dh = session.get(DonHang.class, IdDonHang);
        session.save(dh);
        session.getTransaction().commit();
        return true;
    }
    private String SetIdDonHang(){
        List<DonHang> list = session.createQuery("FROM DonHang ", DonHang.class).list();
        String id ="DH";
        if(list.isEmpty()){
            id+= "0001";
        }else{
            DonHang check = list.get(list.size()-1);
            int num = Integer.parseInt(check.getIdDonHang().substring(3, 6))+1;
            int temp =num;
            int checknum;      
            int c = 1;
            while(num>0){
                checknum = num/c;
                if(checknum>0){
                    c = c*10;   
                }
                num = num/c;
            }
            switch (c) {
                case 10:
                    id +="000"+temp;
                    break;
                case 100:
                    id +="00"+temp;
                    break;
                case 1000:
                    id +="0"+temp;
                    break;
                case 10000:
                    id +=""+temp;
                    break;   
            }
        }      
        return id.toUpperCase();
    }
    
}
