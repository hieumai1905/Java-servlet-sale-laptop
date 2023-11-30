/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.HoaDon;
import Beans.Image;
import Beans.HoaDon;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class HoaDonDAL {
    Session session;
    public HoaDonDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadHoaDon() {
        List<HoaDon> list;
        session.beginTransaction();
        list = session.createQuery("FROM HoaDon ", HoaDon.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public HoaDon getHoaDon(String IdHoaDon)
    {
        session.beginTransaction();
        HoaDon hd = session.get(HoaDon.class, IdHoaDon);
        session.getTransaction().commit();
        return hd;
    }
    
    public boolean addHoaDon(HoaDon hd)
    {
        hd.setIdHoaDon(this.SetIdHoaDon());
        session.beginTransaction();
        session.save(hd);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updateHoaDon(HoaDon hd)
    {
        session.beginTransaction();
        session.saveOrUpdate(hd);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deleteHoaDon(String IdHoaDon)
    {
        session.beginTransaction();
        HoaDon hd = session.get(HoaDon.class, IdHoaDon);
        session.save(hd);
        session.getTransaction().commit();
        return true;
    }
    private String SetIdHoaDon(){
        List<HoaDon> list = session.createQuery("FROM HoaDon ", HoaDon.class).list();
        String id ="HD";
        if(list.isEmpty()){
            id+= "0001";
        }else{
            HoaDon check = list.get(list.size()-1);
            int num = Integer.parseInt(check.getIdHoaDon().substring(3, 6))+1;
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
