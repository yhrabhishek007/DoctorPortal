package com.doctorportal;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

public class DoctorDAO {

//	 JdbcTemplate is better than JDBC because it contains some methods which help us to 
//	reduce the boiler plate code

//	Spring uses jpa , hibernate and JdbcTemplate
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int insertDoctor(Doctor doctor) {

		String sql = "INSERT INTO doctor " + "(doctor_name, doctor_age, doctor_gender, "
				+ "doctor_specialization, doctor_qualification, " + "doctor_experience, doctor_email, doctor_phone, "
				+ "doctor_consultation_fee, doctor_hospital_name, "
				+ "doctor_department, doctor_availability, doctor_shift, "
				+ "doctor_license_number, doctor_date_of_joining, " + "doctor_is_available) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		return jdbcTemplate.update(sql, doctor.getDoctorName(), doctor.getDoctorAge(), doctor.getDoctorGender(),
				doctor.getDoctorSpecialization(), doctor.getDoctorQualification(), doctor.getDoctorExperience(),
				doctor.getDoctorEmail(), doctor.getDoctorPhone(), doctor.getDoctorConsultationFee(),
				doctor.getDoctorHospitalName(), doctor.getDoctorDepartment(), doctor.getDoctorAvailability(),
				doctor.getDoctorShift(), doctor.getDoctorLicenseNumber(),
				java.sql.Date.valueOf(doctor.getDoctorDateOfJoining()), doctor.getDoctorIsAvailable());
	}

	public List<Doctor> getALlDoctorInfo() {
		String sql = "select * from doctor";
		return jdbcTemplate.query(sql, new RowMapperImpl());
	}

	public int delete(int id) {

		String sql = "DELETE FROM doctor WHERE doctor_id = ?";

		return jdbcTemplate.update(sql, id);
	}

	public Doctor getDoctorById(Integer id) {
		String sql = "select * from doctor where doctor_id=?";
		return jdbcTemplate.queryForObject(sql, new RowMapperImpl(), id);
	}

	// Updates all editable details of an existing doctor.
	// We return int because JdbcTemplate.update() returns
	// the number of rows affected in the database.
	public int updateDoctor(Doctor doctor) {

		// Update doctor details using the doctor's ID
		// to identify the existing record.
		String sql = "UPDATE doctor SET " + "doctor_name = ?, " + "doctor_age = ?, " + "doctor_gender = ?, "
				+ "doctor_specialization = ?, " + "doctor_qualification = ?, " + "doctor_experience = ?, "
				+ "doctor_email = ?, " + "doctor_phone = ?, " + "doctor_consultation_fee = ?, "
				+ "doctor_hospital_name = ?, " + "doctor_department = ?, " + "doctor_availability = ?, "
				+ "doctor_shift = ?, " + "doctor_license_number = ?, " + "doctor_date_of_joining = ?, "
				+ "doctor_is_available = ? " + "WHERE doctor_id = ?";

		// Pass the updated values in the same order as the ? placeholders.
		// The final parameter is doctor_id, which identifies the doctor.
		return jdbcTemplate.update(sql, doctor.getDoctorName(), doctor.getDoctorAge(), doctor.getDoctorGender(),
				doctor.getDoctorSpecialization(), doctor.getDoctorQualification(), doctor.getDoctorExperience(),
				doctor.getDoctorEmail(), doctor.getDoctorPhone(), doctor.getDoctorConsultationFee(),
				doctor.getDoctorHospitalName(), doctor.getDoctorDepartment(), doctor.getDoctorAvailability(),
				doctor.getDoctorShift(), doctor.getDoctorLicenseNumber(), doctor.getDoctorDateOfJoining(),
				doctor.getDoctorIsAvailable(), doctor.getDoctorId());
	}

	// Search doctors by name, email, or specialization.
	// Filter by department when a department is selected.
	public List<Doctor> searchDoctors(String keyword, String department) {

		StringBuilder sql = new StringBuilder("SELECT * FROM doctor WHERE 1 = 1");

		List<Object> params = new ArrayList<>();

		// Search condition
		if (keyword != null && !keyword.trim().isEmpty()) {

			sql.append(" AND (doctor_name LIKE ? " + "OR doctor_email LIKE ? " + "OR doctor_specialization LIKE ?)");

			String searchValue = "%" + keyword.trim() + "%";

			params.add(searchValue);
			params.add(searchValue);
			params.add(searchValue);
		}

		// Department filter
		if (department != null && !department.trim().isEmpty()) {

			sql.append(" AND doctor_department = ?");

			params.add(department);
		}

		// Show latest doctors first
		sql.append(" ORDER BY doctor_id Asc");

		return jdbcTemplate.query(sql.toString(), new RowMapperImpl(), params.toArray());
	}

	// Get all unique departments for the dropdown.
	public List<String> getAllDepartments() {

		String sql = "SELECT DISTINCT doctor_department " + "FROM doctor " + "WHERE doctor_department IS NOT NULL "
				+ "AND doctor_department <> '' " + "ORDER BY doctor_department ";

		return jdbcTemplate.queryForList(sql, String.class);
	}

	public List<Doctor> getDoctorsByPage(String keyword, String department, int page, int pageSize) {

		StringBuilder sql = new StringBuilder("SELECT * FROM doctor WHERE 1 = 1");

		List<Object> params = new ArrayList<>();

		// Search by name, email, or specialization
		if (keyword != null && !keyword.trim().isEmpty()) {

			sql.append(" AND (doctor_name LIKE ? " + "OR doctor_email LIKE ? " + "OR doctor_specialization LIKE ?)");

			String searchValue = "%" + keyword.trim() + "%";

			params.add(searchValue);
			params.add(searchValue);
			params.add(searchValue);
		}

		// Filter by department
		if (department != null && !department.trim().isEmpty()) {

			sql.append(" AND doctor_department = ?");
			params.add(department);
		}

		// Pagination
		sql.append(" ORDER BY doctor_id DESC LIMIT ? OFFSET ?");

		int offset = (page - 1) * pageSize;

		params.add(pageSize);
		params.add(offset);

		return jdbcTemplate.query(sql.toString(), new RowMapperImpl(), params.toArray());
	}

	public int getTotalDoctors(String keyword, String department) {

		StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM doctor WHERE 1 = 1");

		List<Object> params = new ArrayList<>();

		if (keyword != null && !keyword.trim().isEmpty()) {

			sql.append(" AND (doctor_name LIKE ? " + "OR doctor_email LIKE ? " + "OR doctor_specialization LIKE ?)");

			String searchValue = "%" + keyword.trim() + "%";

			params.add(searchValue);
			params.add(searchValue);
			params.add(searchValue);
		}

		if (department != null && !department.trim().isEmpty()) {

			sql.append(" AND doctor_department = ?");
			params.add(department);
		}

		return jdbcTemplate.queryForObject(sql.toString(), Integer.class, params.toArray());
	}
	
	public int getTotalDoctorsCount() {

	    String sql = "SELECT COUNT(*) FROM doctor";

	    return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	
	public int getAvailableDoctorsCount() {

	    String sql = "SELECT COUNT(*) FROM doctor WHERE doctor_is_available = 1";

	    return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	public int getUnavailableDoctorsCount() {

	    String sql = "SELECT COUNT(*) FROM doctor WHERE doctor_is_available = 0";

	    return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int getTotalDepartmentsCount() {

	    String sql = "SELECT COUNT(DISTINCT doctor_department) "
	               + "FROM doctor "
	               + "WHERE doctor_department IS NOT NULL "
	               + "AND doctor_department <> ''";

	    return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
}
