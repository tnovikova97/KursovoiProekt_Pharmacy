package pharmacy.dao;
/*
 *  @created 25.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pharmacy.model.Medicament;

import java.util.List;

@Repository
public interface MedDao extends JpaRepository<Medicament, Integer> {

//    public List<Medicament> findByTitleLike(String title);

    @Query(value = "SELECT * FROM medicament WHERE title ilike ?1 and date_end > current_date and quantity > 1", nativeQuery = true)
    public List<Medicament> findByTitleLike(String title);


}
