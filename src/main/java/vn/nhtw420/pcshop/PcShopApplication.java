package vn.nhtw420.pcshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(
        exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class PcShopApplication {

    public static void main(String[] args) {
        SpringApplication.run(PcShopApplication.class, args);
    }

}
