<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Doctor | DoctorPortal</title>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', sans-serif;
	background: #f4f7fb;
	color: #1e293b;
	min-height: 100vh;
}

.navbar {
	height: 72px;
	background: #ffffff;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 7%;
	border-bottom: 1px solid #e8edf4;
}

.brand {
	font-size: 22px;
	font-weight: 700;
	color: #2563eb;
}

.brand span {
	color: #0f172a;
}

.nav-label {
	font-size: 13px;
	color: #64748b;
}

.container {
	max-width: 1050px;
	margin: 40px auto;
	padding: 0 20px;
}

.page-heading {
	margin-bottom: 25px;
}

.page-heading h1 {
	font-size: 28px;
	font-weight: 700;
	margin-bottom: 9px;
	color: #0f172a;
}

.page-heading p {
	font-size: 14px;
	color: #64748b;
	line-height: 1.6;
}

.form-card {
	background: #ffffff;
	border: 1px solid #e5eaf1;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 8px 30px rgba(15, 23, 42, 0.04);
}

.card-header {
	padding: 24px 30px;
	border-bottom: 1px solid #edf1f6;
	display: flex;
	align-items: center;
	gap: 15px;
}

.icon-box {
	width: 48px;
	height: 48px;
	border-radius: 12px;
	background: #eff6ff;
	color: #2563eb;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 23px;
}

.card-header h2 {
	font-size: 17px;
	font-weight: 600;
	margin-bottom: 5px;
}

.card-header p {
	color: #64748b;
	font-size: 12px;
}

form {
	padding: 30px;
}

.section-title {
	font-size: 14px;
	font-weight: 700;
	color: #2563eb;
	margin-bottom: 20px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.section-title::after {
	content: "";
	height: 1px;
	flex: 1;
	background: #e8edf4;
}

.form-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 22px;
	margin-bottom: 32px;
}

.form-group {
	display: flex;
	flex-direction: column;
	gap: 9px;
}

label {
	font-size: 12px;
	font-weight: 600;
	color: #475569;
}

.required {
	color: #ef4444;
}

input, select {
	width: 100%;
	height: 45px;
	padding: 0 13px;
	border: 1px solid #dbe3ed;
	border-radius: 8px;
	background: #ffffff;
	font-family: inherit;
	font-size: 13px;
	color: #1e293b;
	outline: none;
	transition: 0.2s;
}

input::placeholder {
	color: #a0aaba;
}

input:focus, select:focus {
	border-color: #3b82f6;
	box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.10);
}

.form-footer {
	border-top: 1px solid #edf1f6;
	padding-top: 24px;
	display: flex;
	justify-content: flex-end;
	gap: 12px;
}

.btn {
	padding: 12px 22px;
	border-radius: 8px;
	font-family: inherit;
	font-size: 13px;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	border: none;
	transition: 0.2s;
}

.btn-cancel {
	background: #f1f5f9;
	color: #475569;
}

.btn-cancel:hover {
	background: #e2e8f0;
}

.btn-submit {
	background: #2563eb;
	color: #ffffff;
	box-shadow: 0 4px 10px rgba(37, 99, 235, 0.18);
}

.btn-submit:hover {
	background: #1d4ed8;
	transform: translateY(-1px);
}

.footer-note {
	text-align: center;
	font-size: 12px;
	color: #94a3b8;
	margin-top: 25px;
}

@media ( max-width : 768px) {
	.form-grid {
		grid-template-columns: repeat(2, 1fr);
	}
	form {
		padding: 22px;
	}
	.card-header {
		padding: 22px;
	}
}

@media ( max-width : 520px) {
	.form-grid {
		grid-template-columns: 1fr;
	}
	.navbar {
		padding: 0 20px;
	}
	.page-heading h1 {
		font-size: 23px;
	}
	.form-footer {
		flex-direction: column-reverse;
	}
	.btn {
		width: 100%;
		text-align: center;
	}
}
</style>
</head>

<body>

	<!-- Navigation bar -->
	<nav class="navbar">
		<div class="brand">
			Doctor<span>Portal</span>
		</div>
		<div class="nav-label">Doctor Management System</div>
	</nav>

	<main class="container">

		<!-- Page heading -->
		<div class="page-heading">
			<h1>Add New Doctor</h1>
			<p>Register a new medical professional and manage their
				information.</p>
		</div>

		<div class="form-card">

			<!-- Form heading -->
			<div class="card-header">
				<div class="icon-box">✚</div>
				<div>
					<h2>Doctor Information</h2>
					<p>Enter the doctor's personal and professional details below.</p>
				</div>
			</div>

			<!--
                Submit doctor details to /add using POST method.
                This URL must match the controller's POST mapping.
            -->
			<form action="${pageContext.request.contextPath}/add" method="post">

				<div class="section-title">Personal Details</div>

				<div class="form-grid">

					<div class="form-group">
						<label for="doctorName">Full Name <span class="required">*</span></label>
						<input type="text" id="doctorName" name="doctorName"
							placeholder="Dr. John Smith" required>
					</div>

					<div class="form-group">
						<label for="doctorAge">Age <span class="required">*</span></label>
						<input type="number" id="doctorAge" name="doctorAge"
							placeholder="Enter age" min="18" max="100" required>
					</div>

					<div class="form-group">
						<label for="doctorGender">Gender <span class="required">*</span></label>
						<select id="doctorGender" name="doctorGender" required>
							<option value="">Select gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Other">Other</option>
						</select>
					</div>

					<div class="form-group">
						<label for="doctorEmail">Email Address <span
							class="required">*</span></label> <input type="email" id="doctorEmail"
							name="doctorEmail" placeholder="doctor@example.com" required>
					</div>

					<div class="form-group">
						<label for="doctorPhone">Phone Number <span
							class="required">*</span></label> <input type="tel" id="doctorPhone"
							name="doctorPhone" placeholder="9876543210" required>
					</div>

					<div class="form-group">
						<label for="doctorLicenseNumber">Medical License Number <span
							class="required">*</span></label> <input type="text"
							id="doctorLicenseNumber" name="doctorLicenseNumber"
							placeholder="Enter license number" required>
					</div>

				</div>

				<div class="section-title">Professional Details</div>

				<div class="form-grid">

					<div class="form-group">
						<label for="doctorSpecialization">Specialization <span
							class="required">*</span></label> <select id="doctorSpecialization"
							name="doctorSpecialization" required>
							<option value="">Select specialization</option>
							<option value="Cardiology">Cardiology</option>
							<option value="Dermatology">Dermatology</option>
							<option value="Neurology">Neurology</option>
							<option value="Orthopedics">Orthopedics</option>
							<option value="Pediatrics">Pediatrics</option>
							<option value="General Medicine">General Medicine</option>
							<option value="Gynecology">Gynecology</option>
							<option value="Ophthalmology">Ophthalmology</option>
							<option value="Other">Other</option>
						</select>
					</div>

					<div class="form-group">
						<label for="doctorQualification">Qualification <span
							class="required">*</span></label> <input type="text"
							id="doctorQualification" name="doctorQualification"
							placeholder="MBBS, MD" required>
					</div>

					<div class="form-group">
						<label for="doctorExperience">Experience (Years) <span
							class="required">*</span></label> <input type="number"
							id="doctorExperience" name="doctorExperience"
							placeholder="Years of experience" min="0" required>
					</div>

					<div class="form-group">
						<label for="doctorHospitalName">Hospital Name <span
							class="required">*</span></label> <input type="text"
							id="doctorHospitalName" name="doctorHospitalName"
							placeholder="Enter hospital name" required>
					</div>

					<div class="form-group">
						<label for="doctorDepartment">Department <span
							class="required">*</span></label> <input type="text"
							id="doctorDepartment" name="doctorDepartment"
							placeholder="Enter department" required>
					</div>

					<div class="form-group">
						<label for="doctorConsultationFee">Consultation Fee (₹) <span
							class="required">*</span></label> <input type="number"
							id="doctorConsultationFee" name="doctorConsultationFee"
							placeholder="e.g. 500" min="0" step="0.01" required>
					</div>

				</div>

				<div class="section-title">Availability & Schedule</div>

				<div class="form-grid">

					<div class="form-group">
						<label for="doctorAvailability">Working Days <span
							class="required">*</span></label> <select id="doctorAvailability"
							name="doctorAvailability" required>
							<option value="">Select working days</option>
							<option value="Monday - Friday">Monday - Friday</option>
							<option value="Monday - Saturday">Monday - Saturday</option>
							<option value="All Days">All Days</option>
							<option value="Weekends Only">Weekends Only</option>
						</select>
					</div>

					<div class="form-group">
						<label for="doctorShift">Shift <span class="required">*</span></label>
						<select id="doctorShift" name="doctorShift" required>
							<option value="">Select shift</option>
							<option value="Morning">Morning</option>
							<option value="Afternoon">Afternoon</option>
							<option value="Evening">Evening</option>
							<option value="Full Day">Full Day</option>
						</select>
					</div>

					<div class="form-group">
						<label for="doctorDateOfJoining">Date of Joining <span
							class="required">*</span></label> <input type="date"
							id="doctorDateOfJoining" name="doctorDateOfJoining" required>
					</div>

					<div class="form-group">
						<label for="doctorIsAvailable">Currently Available <span
							class="required">*</span></label> <select id="doctorIsAvailable"
							name="doctorIsAvailable" required>
							<option value="">Select status</option>
							<option value="true">Available</option>
							<option value="false">Not Available</option>
						</select>
					</div>

				</div>

				<!-- Form buttons -->
				<div class="form-footer">

					<!-- Return to home page -->
					<a href="${pageContext.request.contextPath}/"
						class="btn btn-cancel">Cancel</a>

					<!-- Submit form data to Spring Controller -->
					<button type="submit" class="btn btn-submit">+ Add Doctor
					</button>

				</div>

			</form>
		</div>

		<div class="footer-note">© 2026 DoctorPortal. Healthcare
			Management System.</div>

	</main>

</body>
</html>
