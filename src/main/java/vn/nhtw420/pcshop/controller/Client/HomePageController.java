package vn.nhtw420.pcshop.controller.Client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import vn.nhtw420.pcshop.domain.Product;
import vn.nhtw420.pcshop.service.ProductService;

import java.util.List;

@Controller
public class HomePageController {

    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        System.out.println("Number of products: " + products.size()); // Debug log
        products.forEach(p -> System.out.println("Product: " + p.getName())); // Debug log
        model.addAttribute("products", products);
        return "client/homepage/show";
    }
}

