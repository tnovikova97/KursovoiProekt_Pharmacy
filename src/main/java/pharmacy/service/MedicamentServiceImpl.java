package pharmacy.service;
/*
 *  @created 23.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pharmacy.dao.MedicamentDao;
import pharmacy.model.Medicament;

import java.util.List;

@Service
public class MedicamentServiceImpl implements MedicamentService {

    @Autowired
    private MedicamentDao medicamentDao;

    public void setMedicamentDao(MedicamentDao medicamentDao) {
        this.medicamentDao = medicamentDao;
    }

    @Override
    @Transactional
    public void addMedicament(Medicament medicament) {
        this.medicamentDao.addMedicament(medicament);
    }

    @Override
    @Transactional
    public void updateMedicament(Medicament medicament) {
        this.medicamentDao.updateMedicament(medicament);
    }

    @Override
    @Transactional
    public List<Medicament> listMedicament() {
        return this.medicamentDao.listMedicament();
    }

    @Override
    @Transactional
    public Medicament getMedicamentById(int id) {
        return this.medicamentDao.getMedicamentById(id);
    }

    @Override
    @Transactional
    public void removeMedicament(int id) {
        this.medicamentDao.removeMedicament(id);
    }
}
