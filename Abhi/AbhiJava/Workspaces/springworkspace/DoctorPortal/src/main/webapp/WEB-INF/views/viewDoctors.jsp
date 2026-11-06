
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DoctorPortal | All Doctors</title>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

:root {
	--primary: #2563eb;
	--primary-dark: #1d4ed8;
	--dark: #172033;
	--muted: #64748b;
	--background: #f5f8fd;
	--border: #e8edf5;
	--white: #ffffff;
}

body {
	font-family: 'Inter', sans-serif;
	background: var(--background);
	color: var(--dark);
	line-height: 1.6;
}

a {
	text-decoration: none;
}

/* Navigation */
.navbar {
	height: 76px;
	background: rgba(255, 255, 255, 0.96);
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 8%;
	border-bottom: 1px solid var(--border);
}

.logo {
	font-size: 24px;
	font-weight: 800;
	color: var(--primary);
	letter-spacing: -1px;
}

.logo span {
	color: var(--dark);
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 30px;
}

.nav-links a {
	font-size: 13px;
	font-weight: 600;
	color: var(--muted);
}

.nav-links a:hover {
	color: var(--primary);
}

.nav-button {
	background: var(--primary);
	color: white !important;
	padding: 11px 19px;
	border-radius: 9px;
}

.nav-button:hover {
	background: var(--primary-dark);
}

/* Main container */
.container {
	max-width: 1250px;
	margin: 45px auto;
	padding: 0 25px;
}

/* Page heading */
.page-heading {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
	flex-wrap: wrap;
	margin-bottom: 30px;
}

.eyebrow {
	display: inline-block;
	color: var(--primary);
	background: #eff6ff;
	padding: 7px 13px;
	border-radius: 30px;
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 1px;
	margin-bottom: 12px;
}

.page-heading h1 {
	font-size: 30px;
	font-weight: 800;
	letter-spacing: -1px;
	margin-bottom: 8px;
}

.page-heading p {
	color: var(--muted);
	font-size: 13px;
}

.add-button {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	background: var(--primary);
	color: white;
	padding: 13px 20px;
	border-radius: 9px;
	font-size: 13px;
	font-weight: 700;
	box-shadow: 0 5px 15px rgba(37, 99, 235, 0.15);
	transition: 0.25s;
}

.add-button:hover {
	background: var(--primary-dark);
	transform: translateY(-2px);
}

/* Summary card */
.summary-card {
	background: white;
	border: 1px solid var(--border);
	border-radius: 15px;
	padding: 22px 25px;
	display: flex;
	align-items: center;
	gap: 18px;
	margin-bottom: 25px;
	box-shadow: 0 3px 12px rgba(15, 23, 42, 0.02);
}

.summary-icon {
	width: 55px;
	height: 55px;
	background: #eff6ff;
	border-radius: 14px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 25px;
}

.summary-card h3 {
	font-size: 25px;
	font-weight: 800;
	line-height: 1.3;
}

.summary-card p {
	color: var(--muted);
	font-size: 12px;
}

/* Table section */
.table-card {
	background: white;
	border: 1px solid var(--border);
	border-radius: 17px;
	overflow: hidden;
	box-shadow: 0 5px 20px rgba(15, 23, 42, 0.03);
}

.table-header {
	padding: 25px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 20px;
	flex-wrap: wrap;
	border-bottom: 1px solid var(--border);
}

.table-header h2 {
	font-size: 18px;
	font-weight: 800;
	margin-bottom: 5px;
}

.table-header p {
	color: var(--muted);
	font-size: 12px;
}

.search-box {
	width: 280px;
	max-width: 100%;
	padding: 12px 15px;
	border: 1px solid var(--border);
	border-radius: 9px;
	outline: none;
	font-family: inherit;
	font-size: 12px;
	background: #f8fafc;
}

.search-box:focus {
	border-color: var(--primary);
	background: white;
}

.table-wrapper {
	width: 100%;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	min-width: 1050px;
}

thead {
	background: #f8fafc;
}

th {
	color: #64748b;
	font-size: 11px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	padding: 16px 20px;
	text-align: left;
	white-space: nowrap;
}

td {
	padding: 17px 20px;
	border-top: 1px solid #eef2f7;
	font-size: 12px;
	color: #475569;
	white-space: nowrap;
}

tbody tr {
	transition: 0.2s;
}

tbody tr:hover {
	background: #f8fbff;
}

.doctor-name {
	color: var(--dark);
	font-weight: 700;
	font-size: 13px;
}

.doctor-email {
	color: var(--muted);
	font-size: 11px;
	margin-top: 3px;
}

.doctor-id {
	display: inline-block;
	background: #f1f5f9;
	color: #64748b;
	padding: 5px 9px;
	border-radius: 6px;
	font-size: 11px;
	font-weight: 700;
}

.status {
	display: inline-block;
	padding: 6px 10px;
	border-radius: 30px;
	font-size: 11px;
	font-weight: 700;
}

.status-available {
	background: #ecfdf5;
	color: #059669;
}

.status-unavailable {
	background: #fff1f2;
	color: #e11d48;
}

.fee {
	color: var(--primary);
	font-weight: 700;
}

/* Empty state */
.empty-state {
	text-align: center;
	padding: 65px 20px;
}

.empty-icon {
	width: 75px;
	height: 75px;
	margin: 0 auto 20px;
	border-radius: 20px;
	background: #eff6ff;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 35px;
}

.empty-state h3 {
	font-size: 18px;
	font-weight: 800;
	margin-bottom: 8px;
}

.empty-state p {
	color: var(--muted);
	font-size: 13px;
	margin-bottom: 22px;
}

.actions {
	display: flex;
	align-items: center;
	gap: 8px;
}

.edit-btn, .delete-btn {
	padding: 7px 12px;
	border-radius: 7px;
	font-size: 11px;
	font-weight: 700;
	transition: 0.2s;
}

.search-container {
	background: #ffffff;
	padding: 20px;
	border-radius: 12px;
	margin-bottom: 25px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.04);
}

.search-form {
	display: flex;
	gap: 12px;
	flex-wrap: wrap;
}

.search-form input, .search-form select {
	padding: 12px 15px;
	border: 1px solid #dbe2ea;
	border-radius: 8px;
	font-size: 14px;
	outline: none;
	background: #ffffff;
}

.search-form input {
	flex: 1;
	min-width: 200px;
}

.search-form select {
	min-width: 200px;
}

.search-form input:focus, .search-form select:focus {
	border-color: #2563eb;
}

.search-btn, .reset-btn {
	padding: 12px 20px;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 600;
	cursor: pointer;
	text-decoration: none;
	border: none;
}

.search-btn {
	background: #2563eb;
	color: white;
}

.search-btn:hover {
	background: #1d4ed8;
}

.reset-btn {
	background: #e2e8f0;
	color: #334155;
}

.reset-btn:hover {
	background: #cbd5e1;
}

@media ( max-width : 600px) {
	.search-form {
		flex-direction: column;
	}
	.search-form input, .search-form select, .search-btn, .reset-btn {
		width: 100%;
	}
}

.dashboard-stats {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	margin: 25px 0;
}

.stat-card {
	display: flex;
	align-items: center;
	gap: 16px;
	background: #ffffff;
	padding: 22px;
	border: 1px solid #e5e7eb;
	border-radius: 14px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
	transition: transform 0.2s ease;
}

.stat-card:hover {
	transform: translateY(-3px);
}

.stat-card h3 {
	font-size: 26px;
	margin: 0;
	color: #1f2937;
}

.stat-card p {
	margin: 6px 0 0;
	color: #6b7280;
	font-size: 14px;
}

.stat-icon {
	width: 48px;
	height: 48px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 12px;
	font-size: 24px;
	font-weight: bold;
}

.stat-icon.blue {
	background: #dbeafe;
	color: #2563eb;
}

.stat-icon.green {
	background: #dcfce7;
	color: #16a34a;
}

.stat-icon.purple {
	background: #ede9fe;
	color: #7c3aed;
}

.stat-icon.orange {
	background: #ffedd5;
	color: #ea580c;
}

@media ( max-width : 900px) {
	.dashboard-stats {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 500px) {
	.dashboard-stats {
		grid-template-columns: 1fr;
	}
}

.edit-btn {
	background: #eff6ff;
	color: #2563eb;
}

.edit-btn:hover {
	background: #dbeafe;
}

.delete-btn {
	background: #fff1f2;
	color: #e11d48;
}

.delete-btn:hover {
	background: #ffe4e6;
}

/* Footer */
footer {
	background: white;
	border-top: 1px solid var(--border);
	padding: 27px 8%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	color: #94a3b8;
	font-size: 12px;
	margin-top: 70px;
}

footer strong {
	color: var(--muted);
}

/* Responsive */
@media ( max-width : 700px) {
	.navbar {
		padding: 0 20px;
	}
	.nav-links {
		gap: 12px;
	}
	.container {
		margin: 30px auto;
		padding: 0 15px;
	}
	.page-heading h1 {
		font-size: 25px;
	}
	.table-header {
		padding: 20px;
	}
	.search-box {
		width: 100%;
	}
	footer {
		flex-direction: column;
		gap: 10px;
		text-align: center;
	}
}
</style>
</head>

<body>

	<!-- Navigation -->

	<nav class="navbar">
		<a href="${pageContext.request.contextPath}/index" class="logo">
			Doctor<span>Portal</span>
		</a>

		<div class="nav-links">
			<a href="${pageContext.request.contextPath}/index">Home</a> <a
				href="${pageContext.request.contextPath}/doctors">Doctors</a> <a
				href="${pageContext.request.contextPath}/addDoctor"
				class="nav-button">+ Add Doctor</a>
		</div>
	</nav>

	<!-- Main content -->

	<main class="container">

		<!-- Page heading -->

		<section class="page-heading">
			<div>
				<div class="eyebrow">HEALTHCARE MANAGEMENT</div>
				<h1>Registered Doctors</h1>
				<p>Manage and review all registered healthcare professionals.</p>
			</div>

			<a href="${pageContext.request.contextPath}/addDoctor"
				class="add-button"> + Add New Doctor </a>
		</section>

		<!-- Total doctor count -->

		<section class="summary-card">
			<div class="summary-icon">👨‍⚕️</div>
			<div>
				<h3>${list.size()}</h3>
				<p>Total Registered Doctors</p>
			</div>
		</section>

		<!-- Doctors table -->

		<section class="table-card">

			<div class="table-header">
				<div>
					<h2>Doctor Directory</h2>
					<p>Complete information about registered doctors</p>
				</div>

				<input type="text" id="doctorSearch" class="search-box"
					placeholder="Search name, department, hospital..."
					onkeyup="searchDoctors()">
			</div>

			<c:choose>

				<c:when test="${not empty list}">

					<!-- Dashboard Summary Cards -->
					<div class="dashboard-stats">

						<div class="stat-card">
							<div class="stat-icon blue">♟</div>
							<div>
								<h3>${totalDoctors}</h3>
								<p>Total Doctors</p>
							</div>
						</div>

						<div class="stat-card">
							<div class="stat-icon green">✓</div>
							<div>
								<h3>${availableDoctors}</h3>
								<p>Available Doctors</p>
							</div>
						</div>

						<div class="stat-card">
							<div class="stat-icon purple">✚</div>
							<div>
								<h3>${totalDepartments}</h3>
								<p>Departments</p>
							</div>
						</div>

						<div class="stat-card">
							<div class="stat-icon orange">!</div>
							<div>
								<h3>${unavailableDoctors}</h3>
								<p>Unavailable Doctors</p>
							</div>
						</div>

					</div>

					<div class="table-wrapper">


						<!-- Doctor Search and Department Filter -->
						<div class="search-container">

							<form action="${pageContext.request.contextPath}/doctors"
								method="get" class="search-form">

								<!-- Search by name, email, or specialization -->
								<input type="text" name="keyword" placeholder="Search doctor..."
									value="${keyword}">

								<!-- Filter by department -->
								<select name="department">

									<option value="">All Departments</option>

									<c:forEach var="dept" items="${departments}">

										<option value="${dept}"
											${selectedDepartment == dept ? 'selected' : ''}>
											${dept}</option>

									</c:forEach>

								</select>

								<button type="submit" class="search-btn">Search</button>

								<a href="${pageContext.request.contextPath}/doctors"
									class="reset-btn"> Reset </a>

							</form>

						</div>
						<table id="doctorTable">



							<thead>
								<tr>
									<th>Doctor ID</th>
									<th>Doctor</th>
									<th>Specialization</th>
									<th>Department</th>
									<th>Hospital</th>
									<th>Experience</th>
									<th>Consultation Fee</th>
									<th>Availability</th>
									<th>Actions</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="doctor" items="${list}">
									<tr>
										<td><span class="doctor-id">#${doctor.doctorId}</span></td>

										<td>
											<div class="doctor-name">Dr. ${doctor.doctorName}</div>
											<div class="doctor-email">${doctor.doctorEmail}</div>
										</td>

										<td>${doctor.doctorSpecialization}</td>
										<td>${doctor.doctorDepartment}</td>
										<td>${doctor.doctorHospitalName}</td>
										<td>${doctor.doctorExperience}years</td>

										<td class="fee">₹${doctor.doctorConsultationFee}</td>

										<td><c:choose>
												<c:when test="${doctor.doctorIsAvailable}">
													<span class="status status-available"> Available </span>
												</c:when>

												<c:otherwise>
													<span class="status status-unavailable"> Unavailable
													</span>
												</c:otherwise>
											</c:choose></td>

										<td class="actions">
											<!-- Open the edit form for this doctor --> <a
											href="${pageContext.request.contextPath}/editdoctorform/${doctor.doctorId}"
											class="edit-btn"> Edit </a> <!-- Delete this doctor --> <a
											href="${pageContext.request.contextPath}/deleteDoctor/${doctor.doctorId}"
											class="delete-btn"
											onclick="return confirm('Are you sure you want to delete this doctor?');">
												Delete </a>

										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>

				</c:when>

				<c:otherwise>

					<div class="empty-state">
						<div class="empty-icon">👨‍⚕️</div>
						<h3>No Doctors Registered Yet</h3>
						<p>Start by adding your first doctor to DoctorPortal.</p>

						<a href="${pageContext.request.contextPath}/addDoctor"
							class="add-button"> + Add First Doctor </a>
					</div>

				</c:otherwise>

			</c:choose>

		</section>

	</main>

	<!-- Footer -->

	<footer>
		<div>
			© 2026 <strong>DoctorPortal</strong>. All rights reserved.
		</div>

		<div>Healthcare Management System</div>
	</footer>

	<!-- Search functionality -->

	<script>
		function searchDoctors() {
			const input = document.getElementById("doctorSearch");
			const filter = input.value.toLowerCase();
			const table = document.getElementById("doctorTable");

			if (!table) {
				return;
			}

			const rows = table.getElementsByTagName("tbody")[0]
					.getElementsByTagName("tr");

			for (let i = 0; i < rows.length; i++) {
				const rowText = rows[i].textContent.toLowerCase();

				if (rowText.includes(filter)) {
					rows[i].style.display = "";
				} else {
					rows[i].style.display = "none";
				}
			}
		}
	</script>

</body>
</html>
