package com.gl.studentregistration.service;

import java.util.List;

import com.gl.studentregistration.entity.Student;

public interface StudentService {
	
	public List<Student> findAll(); 
	
	public Student findById(int theId);

	public void save(Student theStudent);

	public void deleteById(int theId);

	public List<Student> searchBy(String name, String department, String Country);
}
