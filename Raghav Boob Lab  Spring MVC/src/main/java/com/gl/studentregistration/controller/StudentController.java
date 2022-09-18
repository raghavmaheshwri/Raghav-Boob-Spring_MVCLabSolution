package com.gl.studentregistration.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.studentregistration.entity.Student;
import com.gl.studentregistration.service.StudentService;

@Controller
@RequestMapping("/students")
public class StudentController {

	@Autowired
	private StudentService studentService;

	@RequestMapping("/show")
	public String showStudent(Model theModel) {
		List<Student> theStudents = studentService.findAll();
		theModel.addAttribute("Student", theStudents);

		return "list-student";
	}

	// Show add from
	@RequestMapping("/showAddStudent")
	public String showAddFormStudent(Model theModel) {
		Student theStudent = new Student();
		theModel.addAttribute("Student", theStudent);
		return "student-registration";
	}

	// Adding student
	@PostMapping("/add")
	public String addStudent(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("department") String department, @RequestParam("country") String country) {

		Student theStudent;
		if (id != 0) {
			theStudent = studentService.findById(id);
			theStudent.setName(name);
			theStudent.setDepartment(department);
			theStudent.setCountry(country);

		} else
			theStudent = new Student(name, department, country);

		studentService.save(theStudent);

		return "redirect:/students/show";

	}

	// Show add from
	@RequestMapping("/showUpdateStudent")
	public String showUpdateFormStudent(@RequestParam("studentId") int theId, Model theModel) {
		Student theStudent = studentService.findById(theId);
		theModel.addAttribute("Student", theStudent);
		return "student-registration";
	}

	// Delete Student
	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int theId) {
		studentService.deleteById(theId);
		return "redirect:/students/show";

	}

	@RequestMapping("/search")
	public String search(@RequestParam("name") String name, @RequestParam("department") String department,
			@RequestParam("country") String country, Model theModel) {

		if (name.trim().isEmpty() && department.trim().isEmpty() && country.trim().isEmpty()) {
			return "redirect:/students/show";
		} else {
			List<Student> theStudents = studentService.searchBy(name, department, country);

			theModel.addAttribute("Student", theStudents);

			return "list-student";
		}

	}
}
