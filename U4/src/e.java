import org.hibernate.Query;
import org.orm.PersistentSession;

import java.util.Arrays;

public class e {
    public static void main(String[] args) {
        try {
            PersistentSession session = A4PersistentManager.instance().getSession();

            Query query = session.createQuery("from Studiengang");

            query.list().forEach(x -> {
                Studiengang v = (Studiengang) x;

                System.out.printf("%26s%10d ECTS-Summe\n", v.getName(),
                        Arrays.stream(v.vorlesung.toArray("ects"))
                                .map(Vorlesung::getEcts)
                                .mapToInt(Integer::intValue)
                                .sum());
            });

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
