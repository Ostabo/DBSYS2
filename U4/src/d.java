import org.hibernate.Query;
import org.orm.PersistentSession;

public class d {
    public static void main(String[] args) {
        try {
            PersistentSession session = A4PersistentManager.instance().getSession();

            Query query = session.createQuery("from Vorlesung");

            query.list().forEach(x -> {
                Vorlesung v = (Vorlesung) x;
                System.out.printf("%26s%10d ECTS%26s\n", v.getName(), v.getEcts(), v.getStudiengang().getName());
            });

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
