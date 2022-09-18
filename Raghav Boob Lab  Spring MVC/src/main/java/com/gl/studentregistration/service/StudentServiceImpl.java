package com.gl.studentregistration.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gl.studentregistration.entity.Student;

@Repository
public class StudentServiceImpl implements StudentService {

	private SessionFactory sessionFactory;

	// create session
	private Session session;

	@Autowired
	public StudentServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

	}

	
	public List<Student> findAll() {

		// find all the records from the database table
		List<Student> studentsData = session.createQuery("from Student").list();
		return studentsData;
	}


	public Student findById(int theId) {
		Student StudentData = new Student();

		// find record with Id from the database table
		StudentData = session.get(Student.class, theId);

		return StudentData;
	}

	
	@Transactional
	public void save(Student theStudent) {
		Transaction tx = session.beginTransaction();

		// save transaction
		session.saveOrUpdate(theStudent);

		tx.commit();

	}

	@Transactional
	public void deleteById(int theId) {
		Transaction tx = session.beginTransaction();

		// get transaction
		Student theStudent = session.get(Student.class, theId);

		// delete record
		session.delete(theStudent);

		tx.commit();


	}
	
	public List<Student> searchBy(String name, String department, String country) { 
		String query = "";
		if(name.length() != 0 && department.length() != 0 && country.length()!=0) {
			query = "from Student where name like '%" + name.trim() +"%' "
					+ "or department like '% "+ department.trim() + "%' "
							+ "or country like '%" + country.trim() + "%'";
		}
		else if (name.length() != 0){
			query = "from Student where name like '%" + name.trim() +"%' ";
		}
		else if(department.length() != 0 ) {
			query = "from Student where department like '%" + department.trim() +"%'";
		}else {
			query = "from Student where country like '%" + country.trim() +"%'";
		} 
		List<Student> studentsData = session.createQuery(query).list();

		return studentsData;
	}
	
	// print the loop
		@Transactional
		public void print(List<Student> StudentData) {

			for (Student S : StudentData) {
				System.out.println(S);
			}
		}

}
