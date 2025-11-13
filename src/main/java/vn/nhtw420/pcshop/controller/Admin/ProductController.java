package vn.nhtw420.pcshop.controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.nhtw420.pcshop.domain.Product;
import vn.nhtw420.pcshop.service.ProductService;
import vn.nhtw420.pcshop.service.UploadService;

import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("newProduct") Product product,
                                @RequestParam("imageFile") MultipartFile file) {
        String fileName = uploadService.handleAvatarUploadFile(file);
        if (fileName != null) {
            product.setImage(fileName);
        }

        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(Model model, @PathVariable long id) {
        Product product = this.productService.getProductId(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProduct(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductId(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }


    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model,
                                    @ModelAttribute("newProduct") Product product,
                                    @RequestParam("imageFile") MultipartFile file) {
        Product currentProduct = productService.getProductId(product.getId());
        if (currentProduct == null) {
            return "redirect:/admin/product";
        }

        uploadService.updateProductImage(currentProduct, file);
        productService.updateProductInfo(currentProduct, product);

        productService.handleSaveProduct(currentProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProduct(Model model, @PathVariable long id) {
        var product = productService.getProductId(id);
        if (product == null) {
            return "redirect:/admin/product";
        }
        model.addAttribute("newProduct", product);
        return "admin/product/delete";
    }

    @PostMapping("admin/product/delete")
    public String postDeleteProduct(@ModelAttribute("newProduct") Product product) {
        productService.deleteProductId(product.getId());
        return "redirect:/admin/product";
    }
}