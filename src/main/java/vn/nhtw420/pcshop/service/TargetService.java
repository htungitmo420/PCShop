package vn.nhtw420.pcshop.service;

import org.springframework.stereotype.Service;
import vn.nhtw420.pcshop.domain.Target;
import vn.nhtw420.pcshop.repository.TargetRepository;

import java.util.List;

@Service
public class TargetService {
    private final TargetRepository targetRepository;

    public TargetService(TargetRepository targetRepository) {
        this.targetRepository = targetRepository;
    }

    public List<Target> getAllTargets() {
        return targetRepository.findAll();
    }

    public Target handleSaveTarget(Target target) {
        return targetRepository.save(target);
    }

    public Target getById(long id) {
        return targetRepository.findById(id);
    }

    public void deleteById(long id) {
        targetRepository.deleteById(id);
    }

    public void updateNameTarget(Target curerntTarget, Target targetWithNewData) {
        curerntTarget.setName(targetWithNewData.getName());
    }

    public boolean existsTargetByName(String name) {
        return targetRepository.existsByName(name);
    }
}
