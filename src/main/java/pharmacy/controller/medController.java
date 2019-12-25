package pharmacy.controller;
/*
 *  @created 24.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pharmacy.model.Medicament;
import pharmacy.service.MedicamentService;

import java.util.List;

@Controller
@RequestMapping("/med")
public class medController {

    @Autowired
    private MedicamentService medicamentService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listMedicament(Model theModel) {
        List<Medicament> medicament = medicamentService.listMedicament();
        theModel.addAttribute("medicament", medicament);
        return "listMedicament";
    }

    @RequestMapping(value = "/showForm", method = RequestMethod.GET)
    public String showFormForAdd(Model theModel) {
        Medicament medicament = new Medicament();
        theModel.addAttribute("medicament", medicament);
        return "medicamentForm";
    }

    @RequestMapping(value = "/saveMedicament", method = RequestMethod.POST)
    public String saveMedicament(@ModelAttribute("medicament") Medicament medicament) {
        if (medicament.getId() == 0) {
            // new medicament, add it
            this.medicamentService.addMedicament(medicament);
        }
        else {
            // existing medicament, call update
            this.medicamentService.updateMedicament(medicament);
        }
        return "redirect:/med/list";
    }

    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String showFormForUpdate(@RequestParam("id") int id,
                                    Model theModel) {
        Medicament medicament = medicamentService.getMedicamentById(id);
        theModel.addAttribute("medicament", medicament);
        return "medicamentForm";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteMedicament(@RequestParam("id") int id) {
        medicamentService.removeMedicament(id);
        return "redirect:/med/list";
    }


//    for users

    @RequestMapping(value = "/listMedicament", method = RequestMethod.GET)
    public String listMedicamentforUser(Model theModel) {
        List<Medicament> medicament = medicamentService.listMedicament();
        theModel.addAttribute("medicament", medicament);
        return "welcome";
    }

    // sorter

    @RequestMapping(value = "/sorterByPrice", method = RequestMethod.GET)
    public String sorterByPrice(Model theModel) {
        List<Medicament> medicament = medicamentService.sorterMedicamentByPrice();
        theModel.addAttribute("medicament", medicament);
        return "welcome";
    }

    @RequestMapping(value = "/sorterByQuantity", method = RequestMethod.GET)
    public String sorterByQuantity(Model theModel) {
        List<Medicament> medicament = medicamentService.sorterMedicamentByQuantity();
        theModel.addAttribute("medicament", medicament);
        return "welcome";
    }

    // search

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model theModel, @RequestParam(defaultValue = "") String title) {
        theModel.addAttribute("medicament", medicamentService.findMedicamentByTitle(title));
        return "welcome";
    }

//    @RequestMapping(value = "/sorterByQuantity", method = RequestMethod.GET)
//    public String sorterByQuantity(Model theModel) {
//        List<Medicament> medicament = medicamentService.getM();
//        theModel.addAttribute("medicament", medicament);
//        return "welcome";
//    }


}
