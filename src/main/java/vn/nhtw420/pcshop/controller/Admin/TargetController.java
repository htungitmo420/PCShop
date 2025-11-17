package vn.nhtw420.pcshop.controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import vn.nhtw420.pcshop.domain.Target;
import vn.nhtw420.pcshop.service.TargetService;

import java.util.List;

@Controller
public class TargetController {

    private final TargetService targetService;

    public TargetController(TargetService targetService) {
        this.targetService = targetService;
    }

    @GetMapping("/admin/audience")
    public String getShowTarget(Model model) {
        List<Target> targets = this.targetService.getAll();
        model.addAttribute("targets", targets);
        return "admin/target/show";
    }

    @GetMapping("/admin/audience/create")
    public String getCreateTarget(Model model) {
        model.addAttribute("newTarget", new Target());
        return "admin/target/create";
    }

    @PostMapping("/admin/audience/create")
    public String createTarget(Model model, @ModelAttribute("newTarget") Target target) {
        if (this.targetService.existsTargetByName(target.getName())) {
            model.addAttribute("errorMessage", "Audience name already exists!");
            model.addAttribute("newTarget", target);
            return "admin/target/create";
        }
        this.targetService.handleSaveTarget(target);
        return "redirect:/admin/audience";
    }

    @GetMapping("/admin/audience/update/{id}")
    public String getUpdateTarget(Model model, @PathVariable long id) {
        Target currentTarget = this.targetService.getById(id);
        model.addAttribute("newTarget", currentTarget);
        model.addAttribute("id", id);
        return "admin/target/update";
    }

    @PostMapping("/admin/audience/update")
    public String postUpdateTarget(Model model, @ModelAttribute("newTarget") Target target) {
        Target currentTarget = this.targetService.getById(target.getId());
        if (currentTarget == null) return "redirect:/admin/audience";

        if (!currentTarget.getName().equals(target.getName()) && this.targetService.existsTargetByName(target.getName())) {
            model.addAttribute("errorMessage", "Audience name already exists!");
            model.addAttribute("newTarget", target);
            model.addAttribute("id", target.getId());
            return "admin/target/update";
        }

        targetService.updateNameTarget(currentTarget, target);
        targetService.handleSaveTarget(currentTarget);
        return "redirect:/admin/audience";
    }

    @GetMapping("/admin/audience/delete/{id}")
    public String getDeleteTarget(Model model, @PathVariable long id) {
        Target target = targetService.getById(id);
        if (target == null) {
            return "redirect:/admin/audience";
        }

        model.addAttribute("newTarget", target);
        return "admin/target/delete";
    }

    @PostMapping("/admin/audience/delete")
    public String postDeleteTarget(@ModelAttribute("newTarget") Target target) {
        targetService.deleteById(target.getId());
        return "redirect:/admin/audience";
    }
}
