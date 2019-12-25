package pharmacy.dao;
/*
 *  @created 23.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import pharmacy.model.Medicament;

import java.util.List;

@Repository
public class MedicamentDaoImpl implements MedicamentDao {

    private static final Logger logger = LoggerFactory.getLogger(MedicamentDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addMedicament(Medicament medicament) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(medicament);
        logger.info("Medicament saved successfully. Medicament Details: " + medicament);
    }

    @Override
    public void updateMedicament(Medicament medicament) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(medicament);
        logger.info("Medicament update successfully. Medicament Details: " + medicament);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Medicament> listMedicament() {
        Session session = this.sessionFactory.getCurrentSession();
//        List<Medicament> medicamentList = session.createQuery("from Medicament").list();
        List<Medicament> medicamentList = session.createCriteria(Medicament.class).addOrder(Order.asc("title")).list();
        for (Medicament medicament : medicamentList) {
            logger.info("Medicament List: " + medicament);
        }
        return medicamentList;
    }

    @Override
    public Medicament getMedicamentById(int id) {
//        Medicament medicament = (Medicament)sessionFactory.getCurrentSession().get(Medicament.class, id);
//        return medicament;

        Session session = this.sessionFactory.getCurrentSession();
        Medicament medicament = (Medicament) session.load(Medicament.class, new Integer(id));
        logger.info("Medicament loaded successfully, Medicament Details: " + medicament);
        return medicament;
    }

    @Override
    public void removeMedicament(int id) {
//        Medicament medicament = getMedicamentById(id);
//        if (null != medicament) {
//            Session session = this.sessionFactory.getCurrentSession();
//            session.delete(medicament);
//        }
//        logger.info("Medicament deleted successfully, Medicament Details: " + medicament);

        Session session = this.sessionFactory.getCurrentSession();
        Medicament medicament = (Medicament) session.load(Medicament.class, new Integer(id));
        if (medicament != null) {
            session.delete(medicament);
        }

        logger.info("Medicament deleted successfully. Medicament Details: " + medicament);

    }
}
