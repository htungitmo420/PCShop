package vn.nhtw420.pcshop.service;

import org.springframework.stereotype.Service;
import vn.nhtw420.pcshop.domain.Role;
import vn.nhtw420.pcshop.domain.User;
import vn.nhtw420.pcshop.repository.RoleRepository;
import vn.nhtw420.pcshop.repository.UserRepository;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final FileService fileService;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, FileService fileService) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.fileService = fileService;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public void handleSaveUser(User user) {
        this.userRepository.save(user);
    }

    public User getUserId(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserId(long id, String avatarDir) {
        User user = this.getUserId(id);
        if (user != null) {
            if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {
                fileService.deleteFile(avatarDir, user.getAvatar());
            }
            this.userRepository.deleteById(id);
        }
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public List<Role> getAllRoles() {
        return this.roleRepository.findAll();
    }

    public Role getRoleById(long id) {
        return this.roleRepository.findById(id).orElse(null);
    }

    public void updateUserRole(User currentUser, User userWithNewData) {
        if (userWithNewData.getRole() == null || userWithNewData.getRole().getId() <= 0) return;

        Role role = getRoleById(userWithNewData.getRole().getId());
        if (role != null) {
            currentUser.setRole(role);
        }
    }

    public void updateUserInfo(User currentUser, User userWithNewData) {
        currentUser.setAddress(userWithNewData.getAddress());
        currentUser.setFullName(userWithNewData.getFullName());
        currentUser.setPhoneNumber(userWithNewData.getPhoneNumber());
    }
}
