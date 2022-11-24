import org.hibernate.Query;
import org.orm.PersistentSession;

import java.util.Arrays;
import java.util.List;

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

            System.out.println();

            Query q = session.createQuery(
                    "select s.name, sum(v.ects) " +
                            "from Studiengang s, Vorlesung v " +
                            "where v.studiengang = s " +
                            "group by s.name"
            );

            List<Object[]> x = q.list();
            x.forEach(res -> {
                System.out.printf("%26s%10s ECTS-Summe\n", res[0], res[1]);
            });

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
