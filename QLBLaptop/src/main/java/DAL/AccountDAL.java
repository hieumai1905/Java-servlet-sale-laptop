/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Beans.Account;
import Beans.Image;
import Beans.Account;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author maiho
 */
public class AccountDAL {
    Session session;
    public AccountDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }
    
    public List loadAccount() {
        List<Account> list;
        session.beginTransaction();
        list = session.createQuery("FROM Account ", Account.class).list();
        session.getTransaction().commit();
        return list;
    }
    
    public Account getAccount(String IdAccount)
    {
        session.beginTransaction();
        Account p = session.get(Account.class, IdAccount);
        session.getTransaction().commit();
        return p;
    }
    
    public boolean addAccount(Account ac)
    {
        session.beginTransaction();
        session.save(ac);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean updateAccount(Account ac)
    {
        session.beginTransaction();
        session.saveOrUpdate(ac);
        session.getTransaction().commit();
        return true;
    }
    
    public boolean deleteAccount(String IdPerson)
    {
        session.beginTransaction();
        Account ac = session.get(Account.class, IdPerson);
        session.save(ac);
        session.getTransaction().commit();
        return true;
    }
    
}
