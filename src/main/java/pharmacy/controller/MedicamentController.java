package pharmacy.controller;
/*
 *  @created 23.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pharmacy.model.Medicament;
import pharmacy.service.MedicamentService;

@Controller
public class MedicamentController {

    @Autowired
    private MedicamentService medicamentService;

    @RequestMapping(value = "/medicament", method = RequestMethod.GET)
    public String listMedicament(Model model) {
        model.addAttribute("medicament", new Medicament());
        model.addAttribute("listMedicament", this.medicamentService.listMedicament());
        return "medicament";
    }

    // For add and update medicament both
    @RequestMapping(value = "/medicament/add", method = RequestMethod.POST)
    public String addMedicament(@ModelAttribute("medicament") Medicament m){
        if (m.getId() == 0) {
            // new medicament, add it
            this.medicamentService.addMedicament(m);
        }
        else {
            // existing medicament, call update
            this.medicamentService.updateMedicament(m);
        }

        return "redirect:/medicament";
    }

    @RequestMapping(value = "/medicament/insert", method = RequestMethod.POST)
    public String newMedicament(@ModelAttribute("medicament") Medicament m){
            this.medicamentService.addMedicament(m);
        return "redirect:/medicament";
    }

    @RequestMapping(value = "/medicament/update", method = RequestMethod.POST)
    public String updMedicament(@ModelAttribute("medicament") Medicament m){
        this.medicamentService.updateMedicament(m);
        return "redirect:/medicament";
    }

    @RequestMapping("/remove/{id}")
    public String removeMedicament(@PathVariable("id") int id) {
        this.medicamentService.removeMedicament(id);
        return "redirect:/medicament";
    }

    @RequestMapping("/edit/{id}")
    public String editMedicament(@PathVariable("id") int id, Model model){
        model.addAttribute("medicament", this.medicamentService.getMedicamentById(id));
        model.addAttribute("listMedicament", this.medicamentService.listMedicament());
        return "medicament";
    }
}
