package pharmacy.service;

import pharmacy.model.User;

/**
 * Service class for {@link User}
 *
 * @author Tatyana Novikova
 * @version 1.0
 */

public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
