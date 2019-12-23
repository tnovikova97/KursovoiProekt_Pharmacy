package pharmacy.dao;
/*
 *  @created 23.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */


import pharmacy.model.Medicament;

import java.util.List;

public interface MedicamentDao{

    public void addMedicament(Medicament medicament);

    public void updateMedicament(Medicament medicament);

    public List<Medicament> listMedicament();

    public Medicament getMedicamentById(int id);

    public void removeMedicament(int id);
}
