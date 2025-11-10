package vn.nhtw420.pcshop.service;

import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.nhtw420.pcshop.domain.User;

import java.io.File;
import java.io.IOException;

@Service
public class UploadService {

    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file) {
        try {
            if (file != null && !file.isEmpty()) {
                String rootPath = servletContext.getRealPath("/resources/images");
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

        String fileName = handleSaveUploadFile(file);

        if (fileName != null) {
            user.setAvatar(fileName);
        }
    }
}
