<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor | Doctor Portal</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background: #f4f7fb;
	color: #1e293b;
}

.navbar {
	background: #172554;
	color: white;
	padding: 20px 7%;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.navbar h2 {
	font-size: 22px;
}

.navbar a {
	color: white;
	text-decoration: none;
	font-size: 14px;
}

.container {
	max-width: 950px;
	margin: 40px auto;
	padding: 0 20px;
}

.page-heading {
	margin-bottom: 25px;
}

.page-heading h1 {
	font-size: 28px;
	margin-bottom: 8px;
	color: #172554;
}

.page-heading p {
	color: #64748b;
	font-size: 14px;
}

.form-card {
	background: white;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
}

.form-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 22px;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group label {
	font-size: 13px;
	font-weight: bold;
	margin-bottom: 8px;
	color: #334155;
}

.form-group input, .form-group select {
	padding: 12px;
	border: 1px solid #cbd5e1;
	border-radius: 7px;
	font-size: 14px;
	outline: none;
	background: white;
}

.form-group input:focus, .form-group select:focus {
	border-color: #2563eb;
	box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
}

.section-title {
	grid-column: 1/-1;
	font-size: 16px;
	color: #172554;
	padding-bottom: 10px;
	border-bottom: 1px solid #e2e8f0;
	margin-top: 8px;
}

.form-actions {
	display: flex;
	justify-content: flex-end;
	gap: 12px;
	margin-top: 30px;
}

.btn {
	padding: 12px 20px;
	border-radius: 7px;
	border: none;
	text-decoration: none;
	font-size: 14px;
	cursor: pointer;
}

.cancel-btn {
	background: #e2e8f0;
	color: #334155;
}

.update-btn {
	background: #2563eb;
	color: white;
}

.update-btn:hover {
	background: #1d4ed8;
}

@media ( max-width : 650px) {
	.form-grid {
		grid-template-columns: 1fr;
	}
	.form-card {
		padding: 20px;
	}
	.navbar {
		padding: 18px 5%;
	}
}
</style>
</head>

<body>

	<div class="navbar">
		<h2>Doctor Portal</h2>

		<a href="${pageContext.request.contextPath}/doctors"> ← Back to
			Doctors </a>
	</div>

	<div class="container">

		<div class="page-heading">
			<h1>Edit Doctor</h1>
			<p>Update the doctor's professional and personal information.</p>
		</div>

		<div class="form-card">

			<!--
                This form sends updated doctor information
                to the updateDoctor controller using POST.
            -->
			<form action="${pageContext.request.contextPath}/updateDoctor"
				method="post">

				<div class="form-grid">

					<h3 class="section-title">Personal Information</h3>

					<!-- Keep the doctor ID hidden.
                         It identifies which database record to update. -->
					<input type="hidden" name="doctorId" value="${doctor.doctorId}">

					<div class="form-group">
						<label>Doctor Name</label> <input type="text" name="doctorName"
							value="${doctor.doctorName}" required>
					</div>

					<div class="form-group">
						<label>Age</label> <input type="number" name="doctorAge"
							value="${doctor.doctorAge}" min="1" required>
					</div>

					<div class="form-group">
						<label>Gender</label> <select name="doctorGender" required>
							<option value="Male"
								${doctor.doctorGender == 'Male' ? 'selected' : ''}>
								Male</option>

							<option value="Female"
								${doctor.doctorGender == 'Female' ? 'selected' : ''}>
								Female</option>

							<option value="Other"
								${doctor.doctorGender == 'Other' ? 'selected' : ''}>
								Other</option>
						</select>
					</div>

					<div class="form-group">
						<label>Email</label> <input type="email" name="doctorEmail"
							value="${doctor.doctorEmail}" required>
					</div>

					<div class="form-group">
						<label>Phone Number</label> <input type="text" name="doctorPhone"
							value="${doctor.doctorPhone}" required>
					</div>

					<h3 class="section-title">Professional Information</h3>

					<div class="form-group">
						<label>Specialization</label> <input type="text"
							name="doctorSpecialization"
							value="${doctor.doctorSpecialization}" required>
					</div>

					<div class="form-group">
						<label>Qualification</label> <input type="text"
							name="doctorQualification" value="${doctor.doctorQualification}"
							required>
					</div>

					<div class="form-group">
						<label>Experience (Years)</label> <input type="number"
							name="doctorExperience" value="${doctor.doctorExperience}"
							min="0" required>
					</div>

					<div class="form-group">
						<label>Department</label> <input type="text"
							name="doctorDepartment" value="${doctor.doctorDepartment}"
							required>
					</div>

					<div class="form-group">
						<label>Hospital Name</label> <input type="text"
							name="doctorHospitalName" value="${doctor.doctorHospitalName}"
							required>
					</div>

					<div class="form-group">
						<label>Consultation Fee (₹)</label> <input type="number"
							step="0.01" name="doctorConsultationFee"
							value="${doctor.doctorConsultationFee}" min="0" required>
					</div>

					<div class="form-group">
						<label>Availability</label> <input type="text"
							name="doctorAvailability" value="${doctor.doctorAvailability}">
					</div>

					<div class="form-group">
						<label>Shift</label> <input type="text" name="doctorShift"
							value="${doctor.doctorShift}">
					</div>

					<div class="form-group">
						<label>License Number</label> <input type="text"
							name="doctorLicenseNumber" value="${doctor.doctorLicenseNumber}"
							required>
					</div>

					<div class="form-group">
						<label>Date of Joining</label> <input type="date"
							name="doctorDateOfJoining" value="${doctor.doctorDateOfJoining}">
					</div>

					<div class="form-group">
						<label>Currently Available?</label> <select
							name="doctorIsAvailable" required>
							<option value="true"
								${doctor.doctorIsAvailable == true ? 'selected' : ''}>
								Available</option>

							<option value="false"
								${doctor.doctorIsAvailable == false ? 'selected' : ''}>
								Unavailable</option>
						</select>
					</div>

				</div>

				<div class="form-actions">

					<a href="${pageContext.request.contextPath}/doctors"
						class="btn cancel-btn"> Cancel </a>

					<button type="submit" class="btn update-btn">Update Doctor
					</button>

				</div>

			</form>

		</div>
	</div>

</body>
</html>
