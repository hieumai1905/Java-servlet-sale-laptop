/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.PhieuNhap;
import Beans.Image;
import Beans.PhieuNhap;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class PhieuNhapDAL {
    Session session;
    public PhieuNhapDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadPhieuNhap() {
        List<PhieuNhap> list;
        session.beginTransaction();
        list = session.createQuery("FROM PhieuNhap ", PhieuNhap.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public PhieuNhap getPhieuNhap(String IdPhieuNhap)
    {
        session.beginTransaction();
        PhieuNhap pn = session.get(PhieuNhap.class, IdPhieuNhap);
        session.getTransaction().commit();
        return pn;
    }
    
    public boolean addPhieuNhap(PhieuNhap pn)
    {
        pn.setIdPhieu(this.SetIdPhieuNhap());
        session.beginTransaction();
        session.save(pn);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updatePhieuNhap(PhieuNhap pn)
    {
        session.beginTransaction();
        session.saveOrUpdate(pn);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deletePhieuNhap(String IdPhieuNhap)
    {
        session.beginTransaction();
        PhieuNhap pn = session.get(PhieuNhap.class, IdPhieuNhap);
        session.save(pn);
        session.getTransaction().commit();
        return true;
    }
    private String SetIdPhieuNhap(){
        List<PhieuNhap> list = session.createQuery("FROM PhieuNhap ", PhieuNhap.class).list();
        String id ="PN";
        if(list.isEmpty()){
            id+= "0001";
        }else{
            PhieuNhap check = list.get(list.size()-1);
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
