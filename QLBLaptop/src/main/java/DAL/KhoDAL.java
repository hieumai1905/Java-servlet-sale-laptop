package DAL;

import Beans.Kho;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class KhoDAL {
    private Session session;

    public KhoDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }

    public List<Kho> getAllKho() {
        Transaction transaction = null;
        List<Kho> list = null;
        try {
            transaction = session.beginTransaction();
            list = session.createQuery("FROM Kho", Kho.class).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return list;
    }

    public boolean addKho(Kho kho) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(kho);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public Kho getKho(int idKho) {
        Transaction transaction = null;
        Kho kho = null;
        try {
            transaction = session.beginTransaction();
            kho = session.get(Kho.class, idKho);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return kho;
    }

    public boolean updateKho(Kho kho) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.merge(kho);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteKho(Kho kho) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(kho);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }
}