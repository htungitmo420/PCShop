package vn.nhtw420.pcshop.service;

import org.springframework.stereotype.Service;
import vn.nhtw420.pcshop.domain.Factory;
import vn.nhtw420.pcshop.repository.FactoryRepository;

import java.util.List;

@Service
public class FactoryService {

    private final FactoryRepository factoryRepository;

    public FactoryService(FactoryRepository factoryRepository) {
        this.factoryRepository = factoryRepository;
    }

    public List<Factory> getAllFactories() {
        return factoryRepository.findAll();
    }

    public void handleSaveFactory(Factory factory) {
        factoryRepository.save(factory);
    }

    public Factory getById(long id) {
        return factoryRepository.findById(id);
    }

    public void deleteById(long id) {
        factoryRepository.deleteById(id);
    }

    public void updateNameFactory(Factory currentFactory, Factory factoryWithNewData) {
        currentFactory.setName(factoryWithNewData.getName());
    }

    public boolean existsFactoryByName(String name) {
        return factoryRepository.existsByName(name);
    }
}
