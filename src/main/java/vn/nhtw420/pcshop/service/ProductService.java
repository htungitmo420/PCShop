package vn.nhtw420.pcshop.service;

import org.springframework.stereotype.Service;
import vn.nhtw420.pcshop.domain.Product;
import vn.nhtw420.pcshop.repository.ProductRepository;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final FileService fileService;

    public ProductService(ProductRepository productRepository, FileService fileService) {
        this.productRepository = productRepository;
        this.fileService = fileService;
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public void handleSaveProduct(Product product) {
        this.productRepository.save(product);
    }

    public Product getProductId(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductId(long id, String imageDir) {
        Product product = this.getProductId(id);
        if (product != null) {
            if (product.getImage() != null && !product.getImage().isEmpty()) {
                fileService.deleteFile(imageDir, product.getImage());
            }
            this.productRepository.deleteById(id);
        }
    }

    public void updateProductInfo(Product currentProduct, Product productWithNewData) {
        currentProduct.setName(productWithNewData.getName());
        currentProduct.setPrice(productWithNewData.getPrice());
        currentProduct.setQuantity(productWithNewData.getQuantity());
        currentProduct.setDetailDesc(productWithNewData.getDetailDesc());
        currentProduct.setShortDesc(productWithNewData.getShortDesc());
    }
}
