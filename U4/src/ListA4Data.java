/**
 * Licensee: Oskar Borkenhagen(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
public class ListA4Data {
	private static final int ROW_COUNT = 100;
	
	public void listTestData() throws PersistentException {
		System.out.println("Listing Vorlesung...");
		Vorlesung[] vorlesungs = Vorlesung.listVorlesungByQuery(null, null);
		int length = Math.min(vorlesungs.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(vorlesungs[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
		System.out.println("Listing Studiengang...");
		Studiengang[] studiengangs = Studiengang.listStudiengangByQuery(null, null);
		length = Math.min(studiengangs.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(studiengangs[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
	}
	
	public static void main(String[] args) {
		try {
			ListA4Data listA4Data = new ListA4Data();
			try {
				listA4Data.listTestData();
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
