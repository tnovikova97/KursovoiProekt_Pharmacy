package pharmacy.Hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import pharmacy.model.Medicament;

public class ConnectionFactory {

    private static SessionFactory sessionFactory;

    private ConnectionFactory() {}

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration().configure();
                configuration.addAnnotatedClass(Medicament.class);
                StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
                sessionFactory = configuration.buildSessionFactory(builder.build());

            } catch (Exception e) {
                System.out.println("Исключение!" + e);
            }
        }
        return sessionFactory;
    }
}

/*

sessionFactory - потокобезопасный, неизменяеммый кэш мэппингов для одной БД
фабрика для создания объектов класса session (хибернейт сессий)

session - однопоточный, короткоживущий объект, являющийся посредником меду приложением и хранилищем объектов.
обертка вокруг jdbc
фабрика для объектов класса transaction

transaction - транзакция. опциональный однопоточный, короткоживущий объект, используемый приложением для
указания атомарной единицы выполняемой работы.

экземпляр класса configuration используется для построения неизменяемой SessionFactory
маппинг берет из файла

 */