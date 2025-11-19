package vn.nhtw420.pcshop.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileService {

    private final static Logger logger = LoggerFactory.getLogger(FileService.class);

    public void deleteFile(String uploadDir, String fileName) {
        if (fileName == null || fileName.isEmpty()) {
            return;
        }

        try {
            Path filePath = Paths.get(uploadDir + File.pathSeparator + fileName);
        } catch (Exception ex) {
            logger.error("Error deleting file", ex);
        }
    }
}