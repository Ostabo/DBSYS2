import org.hibernate.Query;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import org.orm.PersistentTransaction;

public class f {
    public static void main(String[] args) {
        try {
            PersistentSession session = A4PersistentManager.instance().getSession();
            PersistentTransaction t = session.beginTransaction();

            try {

                Vorlesung theoInf = new Vorlesung();
                theoInf.setName("Theoretische Informatik");
                theoInf.setEcts(5);
                theoInf.setSws(4);
                theoInf.setStudiengang(Studiengang.getStudiengangByORMID("Angewandte Informatik"));
                theoInf.save();

                t.commit();

            } catch (PersistentException pe) {
                t.rollback();
                pe.printStackTrace();
            }

            Query query = session.createQuery(
                    "select distinct v1.name from Vorlesung v1, Vorlesung v2, Studiengang s1, Studiengang s2 " +
                            "where s1.name = 'Angewandte Informatik' and s2.name = 'Wirtschaftsinformatik' " +
                            "and v1.studiengang = s1 and v2.studiengang = s2 and v1.name = v2.name"
            );

            query.list().forEach(System.out::println);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
