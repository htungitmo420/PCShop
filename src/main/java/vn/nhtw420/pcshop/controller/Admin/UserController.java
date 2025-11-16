package vn.nhtw420.pcshop.controller.Admin;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.nhtw420.pcshop.domain.Role;
import vn.nhtw420.pcshop.domain.User;
import vn.nhtw420.pcshop.service.UploadService;
import vn.nhtw420.pcshop.service.UserService;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getListUsers(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("roles", this.userService.getAllRoles());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(@ModelAttribute("newUser") User user,
                                 @RequestParam("imageFile") MultipartFile file) {
        String fileName = uploadService.handleAvatarUploadFile(file);
        if (fileName != null && !fileName.isEmpty()) {
            user.setAvatar(fileName);
        }

        user.setPassword(this.passwordEncoder.encode(user.getPassword()));

        if (user.getRole() != null && user.getRole().getId() > 0) {
            Role role = userService.getRoleById(user.getRole().getId());
            user.setRole(role);
        }

        userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }


    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserId(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserId(id);
        model.addAttribute("newUser", currentUser);
        model.addAttribute("roles", this.userService.getAllRoles());
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(
            Model model,
            @ModelAttribute("newUser") User user,
            @RequestParam("imageFile") MultipartFile file) {

        User currentUser = userService.getUserId(user.getId());
        if (currentUser == null) {
            return "redirect:/admin/user";
        }

        if (!file.isEmpty()) {
            if (currentUser.getAvatar() != null && !currentUser.getAvatar().isEmpty()) {
                uploadService.deleteFile("resources/admin/image/user", currentUser.getAvatar());
            }
            String avatar = this.uploadService.handleAvatarUploadFile(file);
            if (avatar != null && !avatar.isEmpty()) {
                currentUser.setAvatar(avatar);
            }
        }

        userService.updateUserRole(currentUser, user);
        userService.updateUserInfo(currentUser, user);

        userService.handleSaveUser(currentUser);
        return "redirect:/admin/user";
    }


    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUser(Model model, @PathVariable long id) {
        var user = userService.getUserId(id);
        if (user == null) {
            return "redirect:/admin/user";
        }
        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(@ModelAttribute("newUser") User user) {
        userService.deleteUserId(user.getId());
        return "redirect:/admin/user";
    }
}