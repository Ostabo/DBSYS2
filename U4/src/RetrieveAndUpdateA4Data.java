/**
 * Licensee: Oskar Borkenhagen(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class RetrieveAndUpdateA4Data {
	public void retrieveAndUpdateTestData() throws PersistentException {
		PersistentTransaction t = A4PersistentManager.instance().getSession().beginTransaction();
		try {
			Vorlesung vorlesung = Vorlesung.loadVorlesungByQuery(null, null);
			// Update the properties of the persistent object
			vorlesung.save();
			Studiengang studiengang = Studiengang.loadStudiengangByQuery(null, null);
			// Update the properties of the persistent object
			studiengang.save();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			RetrieveAndUpdateA4Data retrieveAndUpdateA4Data = new RetrieveAndUpdateA4Data();
			try {
				retrieveAndUpdateA4Data.retrieveAndUpdateTestData();
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
