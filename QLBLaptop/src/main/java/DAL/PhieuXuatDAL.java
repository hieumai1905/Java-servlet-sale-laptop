/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.PhieuXuat;
import Beans.Image;
import Beans.PhieuXuat;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class PhieuXuatDAL {
    Session session;
    public PhieuXuatDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadPhieuXuat() {
        List<PhieuXuat> list;
        session.beginTransaction();
        list = session.createQuery("FROM PhieuXuat ", PhieuXuat.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public PhieuXuat getPhieuXuat(String IdPhieuXuat)
    {
        session.beginTransaction();
        PhieuXuat px = session.get(PhieuXuat.class, IdPhieuXuat);
        session.getTransaction().commit();
        return px;
    }
    
    public boolean addPhieuXuat(PhieuXuat px)
    {
        session.beginTransaction();
        session.save(px);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updatePhieuXuat(PhieuXuat px)
    {
        session.beginTransaction();
        session.saveOrUpdate(px);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deletePhieuXuat(String IdPhieuXuat)
    {
        session.beginTransaction();
        PhieuXuat px = session.get(PhieuXuat.class, IdPhieuXuat);
        session.save(px);
        session.getTransaction().commit();
        return true;
    }
    private String SetIdPhieuXuat(){
        List<PhieuXuat> list = session.createQuery("FROM PhieuXuat ", PhieuXuat.class).list();
        String id ="PX";
        if(list.isEmpty()){
            id+= "0001";
        }else{
            PhieuXuat check = list.get(list.size()-1);
            int num = Integer.parseInt(check.getIdPhieu().substring(3, 6))+1;
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
