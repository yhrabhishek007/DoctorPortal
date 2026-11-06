
package com.doctorportal;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DoctorController {

	@Autowired
	DoctorDAO doctorDao;

	// Display Home Page with Dashboard Statistics
	@RequestMapping(value = "/index")
	public String homePage(Model model) {

		List<Doctor> doctorList = doctorDao.getALlDoctorInfo();

		model.addAttribute("list", doctorList);
		model.addAttribute("totalDoctors", doctorList.size());

		long totalDepartments = doctorList.stream().map(Doctor::getDoctorDepartment)
				.filter(d -> d != null && !d.trim().isEmpty()).distinct().count();

		model.addAttribute("totalDepartments", totalDepartments);

		long availableDoctors = doctorList.stream().filter(d -> Boolean.TRUE.equals(d.getDoctorIsAvailable())).count();

		model.addAttribute("availableDoctors", availableDoctors);

		return "index";
	}

	// Open the home page when the application root URL is accessed.
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}

//	// Display All Doctors Page
//	@RequestMapping(value = "/doctors", method = RequestMethod.GET)
//	public String viewAllDoctors(Model model) {
//
//		List<Doctor> doctorList = doctorDao.getALlDoctorInfo();
//
//		model.addAttribute("list", doctorList);
//
//		return "viewDoctors";
//	}

	// If we don't specify the method in @RequestMapping,
	// Spring accepts all HTTP methods (GET, POST, PUT, DELETE, etc.).
	//
	// We specify GET because our JSP uses an <a> link,
	// and an <a> link sends a GET request by default.

	// Handles the GET request sent when the user clicks the Delete link
	@RequestMapping(value = "/deleteDoctor/{id}", method = RequestMethod.GET)
	public String deleteDoctor(@PathVariable("id") Integer id) {

		// @PathVariable extracts the doctor ID from the URL
		// Example URL: /deleteDoctor/5 → id = 5

		// Call the DAO to delete the doctor with the given ID from the database
		doctorDao.delete(id);

		// After deletion, redirect the user to the Doctors list page
		// The list will be loaded again with the updated database records
		return "redirect:/doctors";
	}

	@RequestMapping(value = "/updateDoctor", method = RequestMethod.POST)
	public String updateDoctor(@ModelAttribute("doctor") Doctor doctor) {
		doctorDao.updateDoctor(doctor);
		return "redirect:/doctors";
	}

	// GET is used to retrieve the existing doctor details
	// and display them in the edit form.
	@RequestMapping(value = "/editdoctorform/{id}", method = RequestMethod.GET)
	public String editDoctorForm(@PathVariable("id") Integer id, Model model) {

		// Fetch the existing doctor from the database.
		Doctor doctor = doctorDao.getDoctorById(id);

		// Send the doctor object to the JSP.
		model.addAttribute("doctor", doctor);

		// Display the edit form.
		return "editDoctor";
	}

	// Display Add Doctor form
	@RequestMapping(value = "/addDoctor", method = RequestMethod.GET)
	public String showAddDoctorForm(Model model) {

		// Create an empty Doctor object and send it to JSP
		model.addAttribute("doctor", new Doctor());

		// Open addDoctor.jsp
		return "addDoctor";
	}

	// Handle POST request when user submits the form
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addDoctor(@ModelAttribute("doctor") Doctor doctor) {

		// Save doctor details into database
		doctorDao.insertDoctor(doctor);

		// Redirect to index page after saving
		return "redirect:/index";
	}
	
	
	@RequestMapping(value = "/doctors", method = RequestMethod.GET)
	public String viewDoctors(
	        @RequestParam(value = "keyword", required = false) String keyword,
	        @RequestParam(value = "department", required = false) String department,
	        Model model) {
		
		model.addAttribute("totalDoctors",
		        doctorDao.getTotalDoctorsCount());

		model.addAttribute("availableDoctors",
		        doctorDao.getAvailableDoctorsCount());

		model.addAttribute("unavailableDoctors",
		        doctorDao.getUnavailableDoctorsCount());

		model.addAttribute("totalDepartments",
		        doctorDao.getTotalDepartmentsCount());

	    // Fetch doctors according to the search and filter values.
	    List<Doctor> list = doctorDao.searchDoctors(keyword, department);

	    // Fetch departments for the filter dropdown.
	    List<String> departments = doctorDao.getAllDepartments();

	    // Send the data to viewDoctors.jsp.
	    model.addAttribute("list", list);
	    model.addAttribute("departments", departments);

	    // Preserve the entered search values.
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("selectedDepartment", department);

	    return "viewDoctors";
	}
}
