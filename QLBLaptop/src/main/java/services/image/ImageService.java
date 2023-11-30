package services.image;

import Beans.Image;
import DAL.ImageDAL;

import java.util.List;
import java.util.Optional;

public class ImageService implements IImageService {
    private ImageDAL imageDAL;

    public ImageService() {
        imageDAL = new ImageDAL();
    }

    @Override
    public Optional<Image> getImageById(int id) {
        Image image = imageDAL.getImage(id);
        return Optional.ofNullable(image);
    }

    @Override
    public void addImage(Image image) {
        imageDAL.addImage(image);
    }

    @Override
    public void updateImage(Image image) {
        imageDAL.updateImage(image);
    }

    @Override
    public void deleteImage(int id) {
        Image image = imageDAL.getImage(id);
        if (image != null) {
            imageDAL.deleteImage(image);
        }
    }

    @Override
    public List<Image> getImageByProductId(String idProduct) {
        return imageDAL.getImageByProductId(idProduct);
    }

    @Override
    public void deleteImageByProductId(String idProduct) {
        imageDAL.deleteImageByProductId(idProduct);
    }
}