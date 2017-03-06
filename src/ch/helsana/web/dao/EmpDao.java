package ch.helsana.web.dao;

import ch.helsana.web.model.pojo.Emp;
import ch.helsana.web.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by hkfq4 on 21.02.2017.
 */
public class EmpDao {

    private Emp emp;
    private Emp newemp;
    private List< Emp > DaoAllEmp;
    private List < Emp > DaoSearchEmpList;


    /**
     * Gibt alle Einträge aus der Tabelle Emp zurück
     *
     * @return Alle Emp als Liste
     */
    public List < Emp > getAllEmployee() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            session.beginTransaction();
            DaoAllEmp = session.createCriteria(Emp.class).list();
            int count = DaoAllEmp.size();
            System.out.println("*EmpDao.java* Anzahl Records vom Dao: " + count);

            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.close();
        return DaoAllEmp;
    }


    /**
     * Die Sortierreihenfolge ist als Übergabeparameter an zu geben. ASC oder DESC
     * @param orderByDirection
     * @return Alle Emp als Liste
     */
    public List < Emp > getAllEmployeeOrderBy(String orderByDirection) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List < Emp > daoSearchList = new ArrayList< >();

        try {
            session.beginTransaction();
            Query qu = session.createQuery("From Emp E order by empno " +  orderByDirection); //order by
            daoSearchList = qu.list();
            int count = daoSearchList.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return daoSearchList;
    }


    /**
     * Sucht in der Tabelle Emp nach der übergebenen Employee Nummer
     * @param RecordNo
     * @return
     */
    public List < Emp > SearchByRecordNo(String RecordNo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List < Emp > daoSearchList = new ArrayList< >();

        // List<Item> daoSearchList =null;
        try {
            session.beginTransaction();
            Query qu = session.createQuery("From Emp E where E.recordno =:recordNo"); //User is the entity not the table
            daoSearchList = qu.list();
            int count = daoSearchList.size();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }

        return daoSearchList;
    }

    /**
     * Fügt einen neuen Employee in die Tabelle Emp ein
     * @param emp
     */
    public void add(Emp emp) {
        Transaction trans = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            String name = emp.getEname();
            System.out.println("*EmpDao.java* Employee Name: " + name);

            // begin a transaction
            session.beginTransaction();
            session.persist(emp);
            session.getTransaction().commit();
            System.out.println("*EmpDao.java* Neuer Employee gespeichert, EmpNo: " + emp.getEname());
        } catch (RuntimeException e) {
            if (trans != null) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }

    /**
     * Löscht den Employee in der Tabelle Emp mit dem übergebenen Employee Objekt
     * @param emp
     */
    public void delete(Emp emp) {
        Transaction trans = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            String EmpName = (emp.getEname());
            System.out.println("*EmpDao.java* Employee gelöscht, EmpName: " + EmpName);

            // begin a transaction
            session.beginTransaction();
            session.delete(emp);
            session.getTransaction().commit();
            System.out.println("*EmpDao.java* Employee gelöscht, : " + emp.toString());
        } catch (RuntimeException e) {
            if (trans != null) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }

    /**
     * Löscht den Employee in der Tabelle Emp mit der übergebenen Employee Nummer
     * @param empid
     */
    public void delete(int empid) {
        Transaction trans = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        Emp empToDelete = new Emp();
        empToDelete.setEmpno(empid);

        try {
            // begin a transaction
            session.beginTransaction();
            session.delete(empToDelete);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trans != null) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }


    /**
     * Updated den übergebenen Employee in der Tabelle Emp
     * @param emp
     */
    public void update(Emp emp) {
        Transaction trans = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            String EmpName = (emp.getEname());
            System.out.println("*EmpDao.java* Employee angepasst, EmpName: " + EmpName);

            // begin a transaction
            session.beginTransaction();
            session.update(emp);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trans != null) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }

    /**
     * Sucht den Employee in der Tabelle Emp mit der übergebenen Employee Nummer
     * @param empno
     * @return
     */
    public Emp getEmpbyEmpNo(int empno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        emp = (Emp) session.get(Emp.class, empno);
        session.getTransaction().commit();
        session.close();
        System.out.println("*EmpDao.java* Employee Object als String: " + emp);
        return emp;
    }

}
