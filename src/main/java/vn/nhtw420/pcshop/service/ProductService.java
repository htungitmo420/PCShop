package vn.nhtw420.pcshop.service;

import org.springframework.stereotype.Service;
import vn.nhtw420.pcshop.domain.Product;
import vn.nhtw420.pcshop.repository.ProductRepository;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
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

    public void deleteProductId(long id) {
        this.productRepository.deleteById(id);
    }

    public void updateProductInfo(Product currentProduct, Product productWithNewData) {
        currentProduct.setName(productWithNewData.getName());
        currentProduct.setImage(productWithNewData.getImage());
        currentProduct.setPrice(productWithNewData.getPrice());
        currentProduct.setQuantity(productWithNewData.getQuantity());
        currentProduct.setSold(productWithNewData.getSold());
        currentProduct.setDetailDesc(productWithNewData.getDetailDesc());
        currentProduct.setShortDesc(productWithNewData.getShortDesc());
        currentProduct.setFactory(productWithNewData.getFactory());
        currentProduct.setTarget(productWithNewData.getTarget());
    }
}
