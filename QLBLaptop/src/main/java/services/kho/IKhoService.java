package services.kho;

import Beans.Kho;

import java.util.List;
import java.util.Optional;

public interface IKhoService {
    Optional<Kho> getKhoById(int id);

    void addKho(Kho kho);

    void updateKho(Kho kho);

    void deleteKho(int idKho);

    List<Kho> getAllKho();
}
