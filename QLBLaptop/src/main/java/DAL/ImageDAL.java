package DAL;

import Beans.Image;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ImageDAL {
    private Session session;

    public ImageDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }

    public boolean addImage(Image image) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(image);
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

    public Image getImage(int imageId) {
        Transaction transaction = null;
        Image image = null;
        try {
            transaction = session.beginTransaction();
            image = session.get(Image.class, imageId);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return image;
    }

    public boolean updateImage(Image image) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.merge(image);
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

    public boolean deleteImage(Image image) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(image);
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

    public List<Image> getImageByProductId(String idProduct) {
        try {
            List<Image> list = session.createQuery("from image where sanpham.idSanPham = :idProduct", Image.class)
                    .setParameter("idProduct", idProduct)
                    .getResultList();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean deleteImageByProductId(String idProduct) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.createQuery("delete from Image where sanpham.idSanPham = :idProduct")
                    .setParameter("idProduct", idProduct)
                    .executeUpdate();
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