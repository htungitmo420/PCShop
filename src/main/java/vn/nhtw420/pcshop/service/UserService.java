package vn.nhtw420.pcshop.service;

import org.springframework.stereotype.Service;
import vn.nhtw420.pcshop.domain.User;
import vn.nhtw420.pcshop.repository.UserRepository;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
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

    public void deleteUserId(long id) {
        this.userRepository.deleteById(id);
    }

}
