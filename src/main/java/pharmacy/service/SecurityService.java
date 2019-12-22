package pharmacy.service;

/**
 * Service for Security.
 *
 * @author Tatyana Novikova
 * @version 1.0
 */

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
