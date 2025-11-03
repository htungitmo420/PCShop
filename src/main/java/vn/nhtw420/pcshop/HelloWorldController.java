package vn.nhtw420.pcshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
    @GetMapping("/")
    public String index() {
        return "Hello world with NHT update!";
    }

    @GetMapping("/user")
    public String UserPage() {
        return "Only user can access this page";
    }

    @GetMapping("/admin")
    public String AdminPage() {
        return "Only admin can access this page";
    }
}
