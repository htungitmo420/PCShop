package vn.nhtw420.pcshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.nhtw420.pcshop.domain.Target;

@Repository
public interface TargetRepository extends JpaRepository<Target, Long> {
    Target findById(long id);

    boolean existsByName(String name);
}
