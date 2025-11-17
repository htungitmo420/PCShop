package vn.nhtw420.pcshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.nhtw420.pcshop.domain.Factory;

@Repository
public interface FactoryRepository extends JpaRepository<Factory, Long> {
    Factory findById(long id);

    boolean existsByName(String name);
}
