/**
 * Licensee: Oskar Borkenhagen(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class DeleteA4Data {
	public void deleteTestData() throws PersistentException {
		PersistentTransaction t = A4PersistentManager.instance().getSession().beginTransaction();
		try {
			Vorlesung vorlesung = Vorlesung.loadVorlesungByQuery(null, null);
			vorlesung.delete();
			Studiengang studiengang = Studiengang.loadStudiengangByQuery(null, null);
			studiengang.delete();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			DeleteA4Data deleteA4Data = new DeleteA4Data();
			try {
				deleteA4Data.deleteTestData();
			}
			finally {
				A4PersistentManager.instance().disposePersistentManager();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
