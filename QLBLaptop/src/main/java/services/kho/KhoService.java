package services.kho;

import Beans.Kho;
import DAL.KhoDAL;
import java.util.List;
import java.util.Optional;

public class KhoService implements IKhoService {
    private KhoDAL khoDAL;

    public KhoService() {
        khoDAL = new KhoDAL();
    }

    @Override
    public Optional<Kho> getKhoById(int id) {
        return Optional.ofNullable(khoDAL.getKho(id));
    }

    @Override
    public void addKho(Kho kho) {
        khoDAL.addKho(kho);
    }

    @Override
    public void updateKho(Kho kho) {
        khoDAL.updateKho(kho);
    }

    @Override
    public void deleteKho(int idKho) {
        Kho kho = khoDAL.getKho(idKho);
        if (kho != null) {
            khoDAL.deleteKho(kho);
        }
    }

    @Override
    public List<Kho> getAllKho() {
        return khoDAL.getAllKho();
    }
}