
package com.doctorportal;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RowMapperImpl implements RowMapper<Doctor> {

	@Override
	public Doctor mapRow(ResultSet rs, int rowNum) throws SQLException {

		// Create a new Doctor object
		Doctor doctor = new Doctor();

		// Retrieve doctor details from database and store in Java object
		doctor.setDoctorId(rs.getInt("doctor_id"));
		doctor.setDoctorName(rs.getString("doctor_name"));
		doctor.setDoctorAge(rs.getInt("doctor_age"));
		doctor.setDoctorGender(rs.getString("doctor_gender"));

		doctor.setDoctorSpecialization(rs.getString("doctor_specialization"));
		doctor.setDoctorQualification(rs.getString("doctor_qualification"));
		doctor.setDoctorExperience(rs.getInt("doctor_experience"));

		doctor.setDoctorEmail(rs.getString("doctor_email"));
		doctor.setDoctorPhone(rs.getString("doctor_phone"));

		doctor.setDoctorConsultationFee(rs.getDouble("doctor_consultation_fee"));
		doctor.setDoctorHospitalName(rs.getString("doctor_hospital_name"));
		doctor.setDoctorDepartment(rs.getString("doctor_department"));

		doctor.setDoctorAvailability(rs.getString("doctor_availability"));
		doctor.setDoctorShift(rs.getString("doctor_shift"));
		doctor.setDoctorLicenseNumber(rs.getString("doctor_license_number"));

		// Convert SQL Date into Java LocalDate
		if (rs.getDate("doctor_date_of_joining") != null) {
			doctor.setDoctorDateOfJoining(rs.getDate("doctor_date_of_joining").toLocalDate());
		}

		doctor.setDoctorIsAvailable(rs.getBoolean("doctor_is_available"));

		// Return the completed Doctor object
		return doctor;
	}
}
