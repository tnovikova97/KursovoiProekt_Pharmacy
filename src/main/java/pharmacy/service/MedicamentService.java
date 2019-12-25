package pharmacy.service;
/*
 *  @created 23.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */

import pharmacy.model.Medicament;

import java.util.Date;
import java.util.List;

public interface MedicamentService {

    public void addMedicament(Medicament medicament);

    public void updateMedicament(Medicament medicament);

    public List<Medicament> listMedicament();

    public Medicament getMedicamentById(int id);

    public void removeMedicament(int id);

//    sorter

    public List<Medicament> sorterMedicamentByPrice();

    public List<Medicament> sorterMedicamentByQuantity();

    public List<Medicament> findMedicamentByTitle(String title);

    //

    public List<Medicament> getM();

}

