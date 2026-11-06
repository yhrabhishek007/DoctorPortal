
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DoctorPortal | Healthcare Management</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet">

<style>

/* ================= GLOBAL STYLING ================= */

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

html {
    scroll-behavior: smooth;
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

/* ================= NAVIGATION ================= */

.navbar {
    height: 76px;
    background: rgba(255,255,255,0.96);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 8%;
    border-bottom: 1px solid var(--border);
    position: sticky;
    top: 0;
    z-index: 100;
    backdrop-filter: blur(12px);
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
    gap: 32px;
}

.nav-links a {
    font-size: 13px;
    font-weight: 600;
    color: var(--muted);
    transition: 0.25s;
}

.nav-links a:hover {
    color: var(--primary);
}

.nav-links .nav-button {
    background: var(--primary);
    color: white;
    padding: 12px 20px;
    border-radius: 9px;
    box-shadow: 0 4px 12px rgba(37,99,235,0.18);
}

.nav-links .nav-button:hover {
    background: var(--primary-dark);
    color: white;
    transform: translateY(-2px);
}

/* ================= HERO SECTION ================= */

.hero {
    max-width: 1250px;
    margin: 45px auto 35px;
    padding: 0 25px;
}

.hero-content {
    background: linear-gradient(120deg, #102b54, #1e4fa3);
    border-radius: 22px;
    padding: 70px 65px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 40px;
    position: relative;
    overflow: hidden;
    box-shadow: 0 18px 45px rgba(30,79,163,0.14);
}

.hero-content::before {
    content: "";
    position: absolute;
    width: 350px;
    height: 350px;
    border-radius: 50%;
    background: rgba(255,255,255,0.04);
    right: 150px;
    top: -180px;
}

.hero-text {
    max-width: 620px;
    position: relative;
    z-index: 2;
}

.eyebrow {
    display: inline-block;
    color: #bfdbfe;
    background: rgba(255,255,255,0.11);
    padding: 9px 15px;
    border-radius: 30px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1px;
    margin-bottom: 24px;
}

.hero h1 {
    color: white;
    font-size: clamp(32px, 4vw, 46px);
    line-height: 1.22;
    font-weight: 800;
    letter-spacing: -1.5px;
    margin-bottom: 20px;
}

.hero h1 span {
    color: #93c5fd;
}

.hero p {
    color: #dbeafe;
    font-size: 14px;
    line-height: 1.9;
    max-width: 510px;
    margin-bottom: 32px;
}

.hero-buttons {
    display: flex;
    gap: 14px;
    flex-wrap: wrap;
}

.primary-button,
.secondary-button {
    padding: 14px 23px;
    border-radius: 9px;
    font-size: 13px;
    font-weight: 700;
    transition: 0.25s;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}

.primary-button {
    background: white;
    color: var(--primary-dark);
}

.primary-button:hover {
    background: #eff6ff;
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.12);
}

.secondary-button {
    color: white;
    border: 1px solid rgba(255,255,255,0.35);
}

.secondary-button:hover {
    background: rgba(255,255,255,0.12);
    transform: translateY(-3px);
}

/* Medical Illustration */

.hero-visual {
    width: 290px;
    height: 290px;
    min-width: 250px;
    border-radius: 50%;
    background: rgba(255,255,255,0.09);
    border: 1px solid rgba(255,255,255,0.13);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    animation: float 4s ease-in-out infinite;
}

.medical-icon {
    font-size: 125px;
    color: white;
}

.floating-card {
    position: absolute;
    bottom: 25px;
    left: -45px;
    background: white;
    border-radius: 12px;
    padding: 16px 20px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.16);
    min-width: 200px;
}

.floating-card strong {
    display: block;
    color: var(--dark);
    font-size: 13px;
    margin-bottom: 4px;
}

.floating-card small {
    color: var(--muted);
    font-size: 11px;
}

@keyframes float {
    0%, 100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-12px);
    }
}

/* ================= STATISTICS ================= */

.stats {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 25px;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 22px;
}

.stat-card {
    background: white;
    border: 1px solid var(--border);
    border-radius: 15px;
    padding: 27px;
    display: flex;
    align-items: center;
    gap: 19px;
    transition: 0.3s;
    box-shadow: 0 3px 12px rgba(15,23,42,0.02);
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 28px rgba(15,23,42,0.07);
}

.stat-icon {
    width: 55px;
    height: 55px;
    min-width: 55px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 25px;
}

.blue {
    background: #eff6ff;
}

.green {
    background: #ecfdf5;
}

.purple {
    background: #f5f3ff;
}

.stat-card h3 {
    font-size: 28px;
    font-weight: 800;
    color: var(--dark);
    line-height: 1.2;
    margin-bottom: 6px;
}

.stat-card p {
    color: var(--muted);
    font-size: 12px;
    font-weight: 500;
}

/* ================= MANAGEMENT SECTION ================= */

.management {
    max-width: 1200px;
    margin: 75px auto;
    padding: 0 25px;
}

.section-heading {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    margin-bottom: 30px;
}

.section-heading h2 {
    font-size: 26px;
    font-weight: 800;
    letter-spacing: -0.7px;
    margin-bottom: 8px;
}

.section-heading p {
    color: var(--muted);
    font-size: 13px;
}

.management-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 24px;
}

.management-card {
    background: white;
    border: 1px solid var(--border);
    border-radius: 17px;
    padding: 30px;
    transition: 0.3s;
    position: relative;
    overflow: hidden;
}

.management-card::after {
    content: "";
    height: 3px;
    width: 0;
    background: var(--primary);
    position: absolute;
    top: 0;
    left: 0;
    transition: 0.3s;
}

.management-card:hover::after {
    width: 100%;
}

.management-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 15px 35px rgba(15,23,42,0.07);
    border-color: #bfdbfe;
}

.management-icon {
    width: 55px;
    height: 55px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 14px;
    font-size: 25px;
    margin-bottom: 23px;
}

.management-card h3 {
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 12px;
}

.management-card p {
    color: var(--muted);
    font-size: 12px;
    line-height: 1.9;
    min-height: 70px;
    margin-bottom: 23px;
}

.card-link {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    color: var(--primary);
    font-size: 12px;
    font-weight: 700;
    transition: 0.2s;
}

.card-link:hover {
    gap: 12px;
    color: var(--primary-dark);
}

/* ================= FOOTER ================= */

footer {
    background: white;
    border-top: 1px solid var(--border);
    padding: 27px 8%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    color: #94a3b8;
    font-size: 12px;
}

footer strong {
    color: var(--muted);
}

/* ================= RESPONSIVE DESIGN ================= */

@media (max-width: 950px) {

    .hero-content {
        padding: 50px 35px;
    }

    .hero-visual {
        width: 220px;
        height: 220px;
        min-width: 220px;
    }

    .medical-icon {
        font-size: 95px;
    }

    .management-grid {
        grid-template-columns: repeat(2, 1fr);
    }

}

@media (max-width: 700px) {

    .navbar {
        padding: 0 20px;
    }

    .nav-links {
        gap: 12px;
    }

    .nav-links a:not(.nav-button) {
        display: none;
    }

    .hero {
        margin-top: 25px;
    }

    .hero-content {
        padding: 38px 25px;
    }

    .hero-visual {
        display: none;
    }

    .hero h1 {
        font-size: 32px;
    }

    .stats {
        grid-template-columns: 1fr;
        gap: 14px;
    }

    .management {
        margin: 50px auto;
    }

    .management-grid {
        grid-template-columns: 1fr;
        gap: 17px;
    }

    .management-card {
        padding: 25px;
    }

    .management-card p {
        min-height: auto;
    }

    .section-heading h2 {
        font-size: 22px;
    }

    footer {
        flex-direction: column;
        gap: 10px;
        text-align: center;
    }

}

@media (prefers-reduced-motion: reduce) {
    *,
    *::before,
    *::after {
        scroll-behavior: auto !important;
        animation: none !important;
        transition: none !important;
    }
}

</style>
</head>

<body>

<!-- ================= NAVIGATION ================= -->

<nav class="navbar">

    <a href="${pageContext.request.contextPath}/index" class="logo">
        Doctor<span>Portal</span>
    </a>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/index">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/doctors">
            Doctors
        </a>

        <a href="${pageContext.request.contextPath}/addDoctor"
           class="nav-button">
            + Add Doctor
        </a>

    </div>

</nav>


<!-- ================= HERO SECTION ================= -->

<section class="hero">

    <div class="hero-content">

        <div class="hero-text">

            <div class="eyebrow">
                HEALTHCARE MANAGEMENT PLATFORM
            </div>

            <h1>
                Smarter Healthcare.<br>
                Better <span>Management.</span>
            </h1>

            <p>
                Manage doctor profiles, organize professional information,
                and simplify healthcare administration with DoctorPortal.
                A centralized platform designed for efficient doctor management.
            </p>

            <div class="hero-buttons">

                <a href="${pageContext.request.contextPath}/addDoctor"
                   class="primary-button">
                    Add New Doctor →
                </a>

                <a href="${pageContext.request.contextPath}/doctors"
                   class="secondary-button">
                    View All Doctors
                </a>

            </div>

        </div>

        <div class="hero-visual">

            <div class="medical-icon">✚</div>

            <div class="floating-card">
                <strong>Doctor Management</strong>
                <small>Organized. Simple. Efficient.</small>
            </div>

        </div>

    </div>

</section>


<!-- ================= STATISTICS ================= -->

<section class="stats">

    <!-- Total Doctors -->

    <div class="stat-card">

        <div class="stat-icon blue">👨‍⚕️</div>

        <div>
            <h3 class="counter" data-target="${totalDoctors}">0</h3>
            <p>Total Registered Doctors</p>
        </div>

    </div>


    <!-- Total Departments -->

    <div class="stat-card">

        <div class="stat-icon green">🏥</div>

        <div>
            <h3 class="counter" data-target="${totalDepartments}">0</h3>
            <p>Total Departments</p>
        </div>

    </div>


    <!-- Available Doctors -->

    <div class="stat-card">

        <div class="stat-icon purple">📅</div>

        <div>
            <h3 class="counter" data-target="${availableDoctors}">0</h3>
            <p>Currently Available Doctors</p>
        </div>

    </div>

</section>


<!-- ================= MANAGEMENT SECTION ================= -->

<section class="management">

    <div class="section-heading">

        <div>
            <h2>Doctor Management</h2>

            <p>
                Everything you need to manage healthcare professionals
                in one place.
            </p>
        </div>

    </div>


    <div class="management-grid">


        <!-- ADD DOCTOR -->

        <div class="management-card">

            <div class="management-icon blue">➕</div>

            <h3>Add New Doctor</h3>

            <p>
                Register a new doctor with personal details,
                qualifications, specialization, hospital information,
                and availability.
            </p>

            <a href="${pageContext.request.contextPath}/addDoctor"
               class="card-link">
                Add Doctor →
            </a>

        </div>


        <!-- VIEW ALL DOCTORS -->

        <div class="management-card">

            <div class="management-icon green">👥</div>

            <h3>View All Doctors</h3>

            <p>
                Browse registered doctors, review their professional
                details, and access doctor information from one place.
            </p>

            <a href="${pageContext.request.contextPath}/doctors"
               class="card-link">
                View Doctors →
            </a>

        </div>


        <!-- DOCTOR AVAILABILITY -->

        <div class="management-card">

            <div class="management-icon purple">🗓️</div>

            <h3>Doctor Availability</h3>

            <p>
                Keep track of doctor working days, shifts,
                consultation fees, and current availability status.
            </p>

            <a href="${pageContext.request.contextPath}/doctors"
               class="card-link">
                View Schedule →
            </a>

        </div>

    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer>

    <div>
        © 2026 <strong>DoctorPortal</strong>. All rights reserved.
    </div>

    <div>
        Healthcare Management System
    </div>

</footer>


<!-- ================= ANIMATED STATISTICS ================= -->

<script>

document.addEventListener("DOMContentLoaded", function() {

    const counters = document.querySelectorAll(".counter");

    counters.forEach(counter => {

        const target = Number(counter.getAttribute("data-target")) || 0;

        // Display zero immediately if there is no data
        if (target <= 0) {
            counter.textContent = "0";
            return;
        }

        const duration = 1000;
        const startTime = performance.now();

        function updateCounter(currentTime) {

            const progress = Math.min(
                (currentTime - startTime) / duration,
                1
            );

            // Smooth animation from zero to actual database value
            const currentValue = Math.floor(target * progress);

            counter.textContent = currentValue;

            if (progress < 1) {
                requestAnimationFrame(updateCounter);
            } else {
                counter.textContent = target;
            }
        }

        requestAnimationFrame(updateCounter);

    });

});

</script>

</body>
</html>
