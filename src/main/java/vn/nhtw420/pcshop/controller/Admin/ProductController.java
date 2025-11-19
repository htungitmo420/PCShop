package vn.nhtw420.pcshop.controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.nhtw420.pcshop.domain.Factory;
import vn.nhtw420.pcshop.domain.Target;
import vn.nhtw420.pcshop.domain.Product;
import vn.nhtw420.pcshop.service.FactoryService;
import vn.nhtw420.pcshop.service.ProductService;
import vn.nhtw420.pcshop.service.TargetService;
import vn.nhtw420.pcshop.service.UploadService;

import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;
    private final FactoryService factoryService;
    private final TargetService targetService;

    public ProductController(ProductService productService, UploadService uploadService, FactoryService factoryService, TargetService targetService) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.factoryService = factoryService;
        this.targetService = targetService;
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
        model.addAttribute("factories", factoryService.getAllFactories());
        model.addAttribute("targets", targetService.getAllTargets());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("newProduct") Product product,
                                @RequestParam("imageFile") MultipartFile file,
                                @RequestParam(value = "factoryId", required = false) Long factoryId,
                                @RequestParam(value = "targetId", required = false) Long targetId) {

        // Set factory
        if (factoryId != null) {
            var factory = factoryService.getById(factoryId);
            product.setFactory(factory);
        }

        // Set target
        if (targetId != null) {
            var target = targetService.getById(targetId);
            product.setTarget(target);
        }

        String fileName = uploadService.handleImageUploadFile(file);
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
        if (currentProduct == null) {
            return "redirect:/admin/product";
        }

        model.addAttribute("newProduct", currentProduct);
        model.addAttribute("factories", factoryService.getAllFactories());
        model.addAttribute("targets", targetService.getAllTargets());

        return "admin/product/update";
    }


    @PostMapping("/admin/product/update")
    public String postUpdateProduct(
            @ModelAttribute("newProduct") Product product,
            @RequestParam("imageFile") MultipartFile file,
            @RequestParam("factoryId") long factoryId,
            @RequestParam(value = "targetId", required = false) Long targetId) {

        Product currentProduct = productService.getProductId(product.getId());
        if (currentProduct == null) {
            return "redirect:/admin/product";
        }

        if (!file.isEmpty()) {
            if (currentProduct.getImage() != null && !currentProduct.getImage().isEmpty()) {
                uploadService.deleteFile("resources/admin/images/product", currentProduct.getImage());
            }
            String image = this.uploadService.handleImageUploadFile(file);
            if (image != null && !image.isEmpty()) {
                currentProduct.setImage(image);
            }
        }

        productService.updateProductInfo(currentProduct, product);

        Factory factory = factoryService.getById(factoryId);
        if (factory != null) {
            currentProduct.setFactory(factory);
        }

        if (targetId != null && targetId > 0) {
            Target target = targetService.getById(targetId);
            if (target != null) {
                currentProduct.setTarget(target);
            }
        } else {
            currentProduct.setTarget(null);
        }

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
        productService.deleteProductId(product.getId(), "resources/admin/images/product");
        return "redirect:/admin/product";
    }

}