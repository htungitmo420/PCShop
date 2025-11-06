package vn.nhtw420.pcshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import vn.nhtw420.pcshop.domain.User;
import vn.nhtw420.pcshop.service.UserService;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        return "hello";
    }

    // Hiển thị danh sách user
    @GetMapping("/admin/user")
    public String getListUsers(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    // Hiển thị form tạo user
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Xử lý submit form tạo user
    @PostMapping("/admin/user/create")
    public String createUserPage(@ModelAttribute("newUser") User nht) {
        this.userService.handleSaveUser(nht);
        return "redirect:/admin/user";
    }
}