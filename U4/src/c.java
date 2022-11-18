import org.orm.PersistentException;
import org.orm.PersistentSession;
import org.orm.PersistentTransaction;

public class c {
    public static void main(String[] args) {
        try {

            PersistentSession session = A4PersistentManager.instance().getSession();
            PersistentTransaction t = session.beginTransaction();

            try {

                Studiengang ain = new Studiengang();
                ain.setName("Angewandte Informatik");
                ain.setAbschluss("Bachelor");
                ain.setKuerzel("AIN");
                ain.save();

                Studiengang win = new Studiengang();
                win.setName("Wirtschaftsinformatik");
                win.setAbschluss("Bachelor");
                win.setKuerzel("WIN");
                win.save();

                Vorlesung db1 = new Vorlesung();
                db1.setName("Datenbanken 1");
                db1.setEcts(5);
                db1.setSws(2);
                db1.setStudiengang(ain);
                db1.save();

                Vorlesung db2 = new Vorlesung();
                db2.setName("Datenbanken 2");
                db2.setEcts(5);
                db2.setSws(2);
                db2.setStudiengang(ain);
                db2.save();

                Vorlesung mathe1 = new Vorlesung();
                mathe1.setName("Mathematik 1");
                mathe1.setEcts(8);
                mathe1.setSws(6);
                mathe1.setStudiengang(ain);
                mathe1.save();

                Vorlesung mathe2 = new Vorlesung();
                mathe2.setName("Mathematik 2");
                mathe2.setEcts(6);
                mathe2.setSws(3);
                mathe2.setStudiengang(ain);
                mathe2.save();

                Vorlesung bsys = new Vorlesung();
                bsys.setName("Betriebssysteme");
                bsys.setEcts(6);
                bsys.setSws(20);
                bsys.setStudiengang(ain);
                bsys.save();

                Vorlesung bwl1 = new Vorlesung();
                bwl1.setName("BWL 1");
                bwl1.setEcts(4);
                bwl1.setSws(2);
                bwl1.setStudiengang(win);
                bwl1.save();

                Vorlesung bwl2 = new Vorlesung();
                bwl2.setName("BWL 2");
                bwl2.setEcts(3);
                bwl2.setSws(2);
                bwl2.setStudiengang(win);
                bwl2.save();

                Vorlesung software1 = new Vorlesung();
                software1.setName("Software Engineering 1");
                software1.setEcts(6);
                software1.setSws(4);
                software1.setStudiengang(win);
                software1.save();

                Vorlesung software2 = new Vorlesung();
                software2.setName("Software Engineering 2");
                software2.setEcts(5);
                software2.setSws(4);
                software2.setStudiengang(win);
                software2.save();

                Vorlesung theoInf = new Vorlesung();
                theoInf.setName("Theoretische Informatik");
                theoInf.setEcts(5);
                theoInf.setSws(4);
                theoInf.setStudiengang(win);
                theoInf.save();

                t.commit();

            } catch (PersistentException p) {
                t.rollback();
                p.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
