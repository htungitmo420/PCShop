package vn.nhtw420.pcshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.nhtw420.pcshop.domain.User;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findById(long user);

    void deleteById(long id);
}
