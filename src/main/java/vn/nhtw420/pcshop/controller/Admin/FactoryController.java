package vn.nhtw420.pcshop.controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vn.nhtw420.pcshop.domain.Factory;
import vn.nhtw420.pcshop.service.FactoryService;

import java.util.List;

@Controller
public class FactoryController {

    private final FactoryService factoryService;

    public FactoryController(FactoryService factoryService) {
        this.factoryService = factoryService;
    }

    @GetMapping("/admin/manufacturer")
    public String getShowFactories(Model model) {
        List<Factory> factories = this.factoryService.getAll();
        model.addAttribute("factories", factories);
        return "/admin/factory/show";
    }

    @GetMapping("/admin/manufacturer/create")
    public String getCreateFactory(Model model) {
        model.addAttribute("newFactory", new Factory());
        return "/admin/factory/create";
    }

    @PostMapping("/admin/manufacturer/create")
    public String createFactory(@ModelAttribute("newFactory") Factory factory, Model model) {
        if (this.factoryService.existsFactoryByName(factory.getName())) {
            model.addAttribute("errorMessage", "Factory name already exists!");
            model.addAttribute("newFactory", factory);
            return "admin/factory/create";
        }
        this.factoryService.handleSaveFactory(factory);
        return "redirect:/admin/manufacturer";
    }

    @GetMapping("/admin/manufacturer/update/{id}")
    public String getUpdateFactory(Model model, @PathVariable long id) {
        Factory currentFactory = this.factoryService.getById(id);
        model.addAttribute("newFactory", currentFactory);
        model.addAttribute("id", id);
        return "/admin/factory/update";
    }

    @PostMapping("/admin/manufacturer/update")
    public String postUpdateFactory(Model model, @ModelAttribute("newFactory") Factory factory) {
        Factory currentFactory = this.factoryService.getById(factory.getId());
        if (currentFactory == null) return "redirect:/admin/manufacturer";

        if (!currentFactory.getName().equals(factory.getName()) && this.factoryService.existsFactoryByName(factory.getName())) {
            model.addAttribute("errorMessage", "Audience name already exists!");
            model.addAttribute("newTarget", factory);
            model.addAttribute("id", factory.getId());
            return "admin/target/update";
        }

        factoryService.updateNameFactory(currentFactory, factory);
        factoryService.handleSaveFactory(currentFactory);
        return "redirect:/admin/manufacturer";
    }

    @GetMapping("/admin/manufacturer/delete/{id}")
    public String getDeleteFactory(Model model, @PathVariable long id) {
        Factory factory = factoryService.getById(id);
        if (factory == null) {
            return "redirect:/admin/manufacturer";
        }

        model.addAttribute("newFactory", factory);
        return "/admin/factory/delete";
    }

    @PostMapping("/admin/manufacturer/delete")
    public String postDeleteFactory(@ModelAttribute("newFactory") Factory factory) {
        factoryService.deleteById(factory.getId());
        return "redirect:/admin/manufacturer";
    }
}
