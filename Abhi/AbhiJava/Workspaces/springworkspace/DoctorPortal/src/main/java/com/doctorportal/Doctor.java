
package com.doctorportal;

import java.time.LocalDate;

public class Doctor {

	private Integer doctorId;
	private String doctorName;
	private Integer doctorAge;
	private String doctorGender;
	private String doctorSpecialization;
	private String doctorQualification;
	private Integer doctorExperience;
	private String doctorEmail;
	private String doctorPhone;
	private Double doctorConsultationFee;
	private String doctorHospitalName;
	private String doctorDepartment;
	private String doctorAvailability;
	private String doctorShift;
	private String doctorLicenseNumber;
	private LocalDate doctorDateOfJoining;
	private Boolean doctorIsAvailable;

	// Default Constructor
	public Doctor() {
	}

	public Integer getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public Integer getDoctorAge() {
		return doctorAge;
	}

	public void setDoctorAge(Integer doctorAge) {
		this.doctorAge = doctorAge;
	}

	public String getDoctorGender() {
		return doctorGender;
	}

	public void setDoctorGender(String doctorGender) {
		this.doctorGender = doctorGender;
	}

	public String getDoctorSpecialization() {
		return doctorSpecialization;
	}

	public void setDoctorSpecialization(String doctorSpecialization) {
		this.doctorSpecialization = doctorSpecialization;
	}

	public String getDoctorQualification() {
		return doctorQualification;
	}

	public void setDoctorQualification(String doctorQualification) {
		this.doctorQualification = doctorQualification;
	}

	public Integer getDoctorExperience() {
		return doctorExperience;
	}

	public void setDoctorExperience(Integer doctorExperience) {
		this.doctorExperience = doctorExperience;
	}

	public String getDoctorEmail() {
		return doctorEmail;
	}

	public void setDoctorEmail(String doctorEmail) {
		this.doctorEmail = doctorEmail;
	}

	public String getDoctorPhone() {
		return doctorPhone;
	}

	public void setDoctorPhone(String doctorPhone) {
		this.doctorPhone = doctorPhone;
	}

	public Double getDoctorConsultationFee() {
		return doctorConsultationFee;
	}

	public void setDoctorConsultationFee(Double doctorConsultationFee) {
		this.doctorConsultationFee = doctorConsultationFee;
	}

	public String getDoctorHospitalName() {
		return doctorHospitalName;
	}

	public void setDoctorHospitalName(String doctorHospitalName) {
		this.doctorHospitalName = doctorHospitalName;
	}

	public String getDoctorDepartment() {
		return doctorDepartment;
	}

	public void setDoctorDepartment(String doctorDepartment) {
		this.doctorDepartment = doctorDepartment;
	}

	public String getDoctorAvailability() {
		return doctorAvailability;
	}

	public void setDoctorAvailability(String doctorAvailability) {
		this.doctorAvailability = doctorAvailability;
	}

	public String getDoctorShift() {
		return doctorShift;
	}

	public void setDoctorShift(String doctorShift) {
		this.doctorShift = doctorShift;
	}

	public String getDoctorLicenseNumber() {
		return doctorLicenseNumber;
	}

	public void setDoctorLicenseNumber(String doctorLicenseNumber) {
		this.doctorLicenseNumber = doctorLicenseNumber;
	}

	// Getter for date of joining
	public LocalDate getDoctorDateOfJoining() {
		return doctorDateOfJoining;
	}

	// Setter for date of joining
	public void setDoctorDateOfJoining(LocalDate doctorDateOfJoining) {
		this.doctorDateOfJoining = doctorDateOfJoining;
	}

	public Boolean getDoctorIsAvailable() {
		return doctorIsAvailable;
	}

	public void setDoctorIsAvailable(Boolean doctorIsAvailable) {
		this.doctorIsAvailable = doctorIsAvailable;
	}

	// Generate getters and setters using IDE

}
