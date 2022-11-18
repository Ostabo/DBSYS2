/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: Oskar Borkenhagen(HTWG Konstanz)
 * License Type: Academic
 */
import org.orm.*;
import org.hibernate.Query;
import org.hibernate.LockMode;
import java.util.List;

public class Studiengang {
	public Studiengang() {
	}
	
	public static Studiengang loadStudiengangByORMID(String name) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return loadStudiengangByORMID(session, name);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang getStudiengangByORMID(String name) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return getStudiengangByORMID(session, name);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang loadStudiengangByORMID(String name, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return loadStudiengangByORMID(session, name, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang getStudiengangByORMID(String name, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return getStudiengangByORMID(session, name, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang loadStudiengangByORMID(PersistentSession session, String name) throws PersistentException {
		try {
			return (Studiengang) session.load(Studiengang.class, name);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang getStudiengangByORMID(PersistentSession session, String name) throws PersistentException {
		try {
			return (Studiengang) session.get(Studiengang.class, name);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang loadStudiengangByORMID(PersistentSession session, String name, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			return (Studiengang) session.load(Studiengang.class, name, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang getStudiengangByORMID(PersistentSession session, String name, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			return (Studiengang) session.get(Studiengang.class, name, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryStudiengang(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return queryStudiengang(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryStudiengang(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return queryStudiengang(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang[] listStudiengangByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return listStudiengangByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang[] listStudiengangByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return listStudiengangByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryStudiengang(PersistentSession session, String condition, String orderBy) throws PersistentException {
		StringBuffer sb = new StringBuffer("From Studiengang as Studiengang");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			return query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryStudiengang(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		StringBuffer sb = new StringBuffer("From Studiengang as Studiengang");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			query.setLockMode("Studiengang", lockMode);
			return query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang[] listStudiengangByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		try {
			List list = queryStudiengang(session, condition, orderBy);
			return (Studiengang[]) list.toArray(new Studiengang[list.size()]);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang[] listStudiengangByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			List list = queryStudiengang(session, condition, orderBy, lockMode);
			return (Studiengang[]) list.toArray(new Studiengang[list.size()]);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang loadStudiengangByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return loadStudiengangByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang loadStudiengangByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return loadStudiengangByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Studiengang loadStudiengangByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		Studiengang[] studiengangs = listStudiengangByQuery(session, condition, orderBy);
		if (studiengangs != null && studiengangs.length > 0)
			return studiengangs[0];
		else
			return null;
	}
	
	public static Studiengang loadStudiengangByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		Studiengang[] studiengangs = listStudiengangByQuery(session, condition, orderBy, lockMode);
		if (studiengangs != null && studiengangs.length > 0)
			return studiengangs[0];
		else
			return null;
	}
	
	public static java.util.Iterator iterateStudiengangByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return iterateStudiengangByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateStudiengangByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = A4PersistentManager.instance().getSession();
			return iterateStudiengangByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateStudiengangByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		StringBuffer sb = new StringBuffer("From Studiengang as Studiengang");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			return query.iterate();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateStudiengangByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		StringBuffer sb = new StringBuffer("From Studiengang as Studiengang");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			query.setLockMode("Studiengang", lockMode);
			return query.iterate();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean equals(Object aObj) {
		if (aObj == this)
			return true;
		if (!(aObj instanceof Studiengang))
			return false;
		Studiengang studiengang = (Studiengang)aObj;
		if ((getName() != null && !getName().equals(studiengang.getName())) || (getName() == null && studiengang.getName() != null))
			return false;
		return true;
	}
	
	public int hashCode() {
		int hashcode = 0;
		hashcode = hashcode + (getName() == null ? 0 : getName().hashCode());
		return hashcode;
	}
	
	public static Studiengang createStudiengang() {
		return new Studiengang();
	}
	
	public boolean save() throws PersistentException {
		try {
			A4PersistentManager.instance().saveObject(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean delete() throws PersistentException {
		try {
			A4PersistentManager.instance().deleteObject(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean refresh() throws PersistentException {
		try {
			A4PersistentManager.instance().getSession().refresh(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean evict() throws PersistentException {
		try {
			A4PersistentManager.instance().getSession().evict(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean deleteAndDissociate()throws PersistentException {
		try {
			Vorlesung[] lVorlesungs = vorlesung.toArray();
			for(int i = 0; i < lVorlesungs.length; i++) {
				lVorlesungs[i].setStudiengang(null);
			}
			return delete();
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean deleteAndDissociate(org.orm.PersistentSession session)throws PersistentException {
		try {
			Vorlesung[] lVorlesungs = vorlesung.toArray();
			for(int i = 0; i < lVorlesungs.length; i++) {
				lVorlesungs[i].setStudiengang(null);
			}
			try {
				session.delete(this);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	private java.util.Set this_getSet (int key) {
		if (key == ORMConstants.KEY_STUDIENGANG_VORLESUNG) {
			return ORM_vorlesung;
		}
		
		return null;
	}
	
	org.orm.util.ORMAdapter _ormAdapter = new org.orm.util.AbstractORMAdapter() {
		public java.util.Set getSet(int key) {
			return this_getSet(key);
		}
		
	};
	
	private String name;
	
	private String kuerzel;
	
	private String abschluss;
	
	private java.util.Set ORM_vorlesung = new java.util.HashSet();
	
	public void setKuerzel(String value) {
		this.kuerzel = value;
	}
	
	public String getKuerzel() {
		return kuerzel;
	}
	
	public void setName(String value) {
		this.name = value;
	}
	
	public String getName() {
		return name;
	}
	
	public String getORMID() {
		return getName();
	}
	
	public void setAbschluss(String value) {
		this.abschluss = value;
	}
	
	public String getAbschluss() {
		return abschluss;
	}
	
	private void setORM_Vorlesung(java.util.Set value) {
		this.ORM_vorlesung = value;
	}
	
	private java.util.Set getORM_Vorlesung() {
		return ORM_vorlesung;
	}
	
	public final VorlesungSetCollection vorlesung = new VorlesungSetCollection(this, _ormAdapter, ORMConstants.KEY_STUDIENGANG_VORLESUNG, ORMConstants.KEY_VORLESUNG_STUDIENGANG, ORMConstants.KEY_MUL_ONE_TO_MANY);
	
	public String toString() {
		return String.valueOf(getName());
	}
	
}
