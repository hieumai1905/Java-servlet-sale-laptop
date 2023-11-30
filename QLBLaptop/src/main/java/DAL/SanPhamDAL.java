package DAL;

import Beans.Image;
import Beans.SanPham;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class SanPhamDAL {
    private Session session;

    public SanPhamDAL() {
        session = HibernateUtils.getSessionFactory().openSession();
    }

    public List<SanPham> loadSanPham() {
        Transaction transaction = null;
        List<SanPham> list = null;
        try {
            session.clear();
            transaction = session.beginTransaction();
            list = session.createQuery("FROM SanPham", SanPham.class).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return list;
    }

    public SanPham getSanPham(String idProduct) {
        Transaction transaction = null;
        SanPham p = null;
        try {
            session.clear();
            transaction = session.beginTransaction();
            p = session.get(SanPham.class, idProduct);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return p;
    }

    public SanPham addSanPham(SanPham sp) {
        Transaction transaction = null;
        try {
            sp.setIdSanPham(this.setIdSanPham(sp));
            transaction = session.beginTransaction();
            session.save(sp);
            transaction.commit();
            return sp;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateSanPham(SanPham sp) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.saveOrUpdate(sp);
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

    public boolean deleteSanPham(SanPham sp) {
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(sp);
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

    private String setIdSanPham(SanPham sp) {
        String brand = sp.getThuongHieu();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            List<SanPham> list = session.createQuery("FROM SanPham WHERE ThuongHieu = :brand", SanPham.class)
                    .setParameter("brand", brand)
                    .list();

            String id = "LT" + sp.getThuongHieu().substring(0, 2);

            if (list.isEmpty()) {
                id += "0001";
            } else {
                SanPham check = list.get(list.size() - 1);
                int num = Integer.parseInt(check.getIdSanPham().substring(4, 8)) + 1;
                int temp = num;
                int checknum;
                int c = 1;

                while (num > 0) {
                    checknum = num / c;
                    if (checknum > 0) {
                        c = c * 10;
                    }
                    num = num / c;
                }

                switch (c) {
                    case 10:
                        id += "000" + temp;
                        break;
                    case 100:
                        id += "00" + temp;
                        break;
                    case 1000:
                        id += "0" + temp;
                        break;
                    case 10000:
                        id += "" + temp;
                        break;
                }
            }

            transaction.commit();
            return id.toUpperCase();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null;
        }
    }

    private String setURLImage(SanPham sp) {
        List<Image> list = sp.getListImage();
        String id = "";

        if (list.isEmpty()) {
            id += sp.getIdSanPham() + "_1";
        } else {
            Image check = list.get(list.size() - 1);
            int i = Integer.parseInt(check.getURL().substring(9, (check.getURL().length() - 4))) + 1;
            id= sp.getIdSanPham() + "_" + i;
        }

        return id;
    }
}