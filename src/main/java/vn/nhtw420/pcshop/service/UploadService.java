package vn.nhtw420.pcshop.service;

import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.nhtw420.pcshop.domain.Product;
import vn.nhtw420.pcshop.domain.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class UploadService {

    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleAvatarUploadFile(MultipartFile file) {
        try {
            if (file != null && !file.isEmpty()) {
                String rootPath = servletContext.getRealPath("/resources/admin/images");
                File dir = new File(rootPath, "avatar");
                if (!dir.exists()) dir.mkdirs();

                String filename = System.currentTimeMillis() + "-" + file.getOriginalFilename();
                File serverFile = new File(dir, filename);

                file.transferTo(serverFile);

                return filename;
            }
            return null;
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public void updateUserAvatar(User user, MultipartFile file) {
        if (file == null || file.isEmpty()) return;

        String fileName = handleAvatarUploadFile(file);

        if (fileName != null) {
            user.setAvatar(fileName);
        }
    }

    public String handleImageUploadFile(MultipartFile file) {
        try {
            if (file != null && !file.isEmpty()) {
                // Lưu vào /resources/admin/images/product
                String rootPath = servletContext.getRealPath("/resources/admin/images");
                File dir = new File(rootPath, "product");
                if (!dir.exists()) dir.mkdirs();

                String filename = System.currentTimeMillis() + "-" + file.getOriginalFilename();
                File serverFile = new File(dir, filename);

                file.transferTo(serverFile);
                return filename;
            }
            return null;
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public void updateProductImage(Product product, MultipartFile file) {
        if (file == null || file.isEmpty()) return;

        String fileName = handleImageUploadFile(file);

        if (fileName != null) {
            product.setImage(fileName);
        }
    }

    public void deleteFile(String dir, String fileName) {
        if (fileName == null || fileName.isBlank()) return;

        String realDir = servletContext.getRealPath("/" + dir);
        if (realDir == null) return;

        Path target = Paths.get(realDir).resolve(fileName);
        try {
            Files.deleteIfExists(target);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
