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
import pharmacy.model.Medicament;
import pharmacy.service.MedicamentService;

import java.util.List;

@Controller
@RequestMapping("/med")
public class medController {

    @Autowired
    private MedicamentService medicamentService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listCustomers(Model theModel) {
        List<Medicament> theCustomers = medicamentService.listMedicament();
        theModel.addAttribute("customers", theCustomers);
        return "list-customers";
    }

    @RequestMapping(value = "/showForm", method = RequestMethod.GET)
    public String showFormForAdd(Model theModel) {
        Medicament theCustomer = new Medicament();
        theModel.addAttribute("customer", theCustomer);
        return "customer-form";
    }

    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
    public String saveCustomer(@ModelAttribute("customer") Medicament theCustomer) {
        if (theCustomer.getId() == 0) {
            // new medicament, add it
            this.medicamentService.addMedicament(theCustomer);
        }
        else {
            // existing medicament, call update
            this.medicamentService.updateMedicament(theCustomer);
        }
        return "redirect:/med/list";
    }

    @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
    public String showFormForUpdate(@RequestParam("id") int id,
                                    Model theModel) {
        Medicament theCustomer = medicamentService.getMedicamentById(id);
        theModel.addAttribute("customer", theCustomer);
        return "customer-form";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteCustomer(@RequestParam("id") int id) {
        medicamentService.removeMedicament(id);
        return "redirect:/med/list";
    }

}
