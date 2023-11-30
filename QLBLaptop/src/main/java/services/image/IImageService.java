package services.image;

import Beans.Image;

import java.util.List;
import java.util.Optional;

public interface IImageService {
    Optional<Image> getImageById(int id);

    void addImage(Image image);

    void updateImage(Image image);

    void deleteImage(int id);

    List<Image> getImageByProductId(String idProduct);

    void deleteImageByProductId(String idProduct);
}
