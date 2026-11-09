# 🩺 DoctorPortal – Doctor Management System

A web-based **Doctor Management System** developed using Java and Spring MVC. DoctorPortal helps manage doctor information through a simple and user-friendly web interface.

The application allows users to add, view, update, delete, and search doctor records. It uses Spring MVC for request handling, JDBC for database operations, and MySQL for storing doctor information.

---

## 📌 Project Overview

DoctorPortal is designed to simplify the management of doctor records in a healthcare organization.

Instead of maintaining doctor details manually, this application provides a centralized platform to manage doctor information, search doctors by different criteria, and keep records organized.

This project demonstrates the implementation of the **MVC architecture, Spring MVC, DAO design pattern, JDBC database connectivity, and CRUD operations** in a Java web application.

## ✨ Features

### Doctor Management

- Add new doctor records.
- View the list of registered doctors.
- Update existing doctor information.
- Delete doctor records.
- Display doctor details in a structured table.

### Search and Filtering

- Search doctors using relevant keywords.
- Filter doctors by department.
- View matching doctor records based on the selected criteria.

### User Interface

- JSP-based web pages.
- Structured doctor listing table.
- Forms for adding and updating doctor details.
- User-friendly navigation between application pages.

### Database Management

- MySQL database integration.
- JDBC-based database operations.
- DAO layer for separating database logic from controller logic.

---

## 🛠️ Technology Stack

| Technology    | Purpose                   |
| ------------- | ------------------------- |
| Java          | Application development   |
| Spring MVC    | Web application framework |
| JSP           | Dynamic web pages         |
| HTML5         | Page structure            |
| CSS3          | Styling and layout        |
| JavaScript    | Client-side interactions  |
| JDBC          | Database connectivity     |
| MySQL         | Data storage              |
| Apache Tomcat | Application server        |
| Eclipse / STS | Development environment   |

---

## 🏗️ Application Architecture

DoctorPortal follows the **Model-View-Controller (MVC) architecture** with a DAO layer for database operations.

```
                User / Browser
                      |
                      v
               Spring Controller
                      |
          -------------------------
          |                       |
          v                       v
       Model / DTO              JSP View
          |
          v
       Doctor DAO
          |
          v
       JDBC / JdbcTemplate
          |
          v
       MySQL Database
       (doctor table)
```

### How the Application Works

1. The user performs an action through the browser, such as adding or searching for a doctor.
2. Spring MVC receives the request through the appropriate controller.
3. The controller calls the Doctor DAO to perform the required database operation.
4. The DAO communicates with MySQL using JDBC.
5. The database returns the result.
6. The controller passes the data to the JSP page.
7. The JSP displays the updated information to the user.

---

## 🧩 MVC Components

### Model

The `Doctor` model represents doctor information stored in the database.

It contains the properties required to maintain doctor records.

### View

JSP pages are responsible for displaying information and collecting user input.

Examples:

- `index.jsp`
- `viewDoctors.jsp`
- `editDoctor.jsp`

### Controller

The `DoctorController` handles incoming HTTP requests and coordinates the application flow.

It communicates with the DAO and returns the appropriate JSP view.

### DAO – Data Access Object

The `DoctorDAO` handles database-related operations such as:

- Inserting doctor records
- Retrieving doctor records
- Updating doctor information
- Deleting doctor records
- Searching and filtering doctors

---

## 📂 Project Structure

The project follows a typical Spring MVC web application structure.

```
DoctorPortal/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── doctorportal/
│       │           ├── DoctorController.java
│       │           ├── DoctorDAO.java
│       │           └── Doctor.java
│       │
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── web.xml
│           │   └── spring-servlet.xml
│           │
│           ├── index.jsp
│           ├── viewDoctors.jsp
│           └── editDoctor.jsp
│
└── README.md
```

> The structure above is an example. Update the package names and file locations to match your actual Eclipse project.

---

## 🗄️ Database Configuration

DoctorPortal uses MySQL to store doctor information.

### Step 1: Create the Database

Open MySQL Workbench or your MySQL command line and execute:

```
CREATE DATABASE doctor_portal;
```

### Step 2: Create the Doctor Table

Create the `doctor` table using the fields defined in your project's `Doctor` model and `DoctorDAO`.

> The table columns and data types must match the SQL queries and RowMapper used in your application.

### Step 3: Configure Database Connectivity

Update your Spring database configuration with your local MySQL connection details.

Example:

```
<bean id="dataSource"
      class="org.springframework.jdbc.datasource.DriverManagerDataSource">

    <property name="driverClassName"
              value="com.mysql.cj.jdbc.Driver"/>

    <property name="url"
              value="jdbc:mysql://localhost:3306/doctor_portal"/>

    <property name="username"
              value="YOUR_MYSQL_USERNAME"/>

    <property name="password"
              value="YOUR_MYSQL_PASSWORD"/>

</bean>
```

Replace the username and password with your local MySQL credentials.

**Security Note:** Do not commit real database passwords or other sensitive information to GitHub.

---

## ⚙️ How to Run the Project

Follow these steps to run DoctorPortal on your local machine.

### Prerequisites

Make sure you have installed:

- Java Development Kit (JDK)
- Eclipse IDE or Spring Tool Suite
- Apache Tomcat
- MySQL Server
- MySQL Workbench (optional)

### Installation Steps

**1. Clone the Repository**

```
git clone https://github.com/YOUR-USERNAME/DoctorPortal.git
```

**2. Open the Project in Eclipse**

- Open Eclipse.
- Select `File → Import`.
- Choose the appropriate project import option.
- Select the cloned DoctorPortal project.

**3. Configure MySQL**

- Start the MySQL server.
- Create the `doctor_portal` database.
- Create the required `doctor` table.
- Configure the database connection in the Spring configuration file.

**4. Configure Apache Tomcat**

- Add Apache Tomcat to Eclipse.
- Associate the DoctorPortal project with the Tomcat server.

**5. Run the Application**

Right-click the project and select:

```
Run As → Run on Server
```

Open the application in your browser using the context path assigned by Eclipse/Tomcat.

Example:

```
http://localhost:8080/DoctorPortal/
```

> The exact URL may differ depending on your Tomcat configuration and project context path.

---

## 📸 Application Screenshots

Screenshots demonstrate the actual user interface and functionality of DoctorPortal.

```
DoctorPortal/
├── screenshots/
│   ├── home-page.png
│   ├── doctor-list.png
│   ├── add-doctor.png
│   └── search-doctor.png
└── README.md
```

### Home Page
[Home Page]([Screenshots/home-doctor.png](https://github.com/yhrabhishek007/DoctorPortal/blob/bd95c88e8c2395fbdb7c3e6db3d05b09baa0dd5e/Screenshot%202026-11-06%20231445.png))

### Registered Doctors
[Registered Doctors]([screenshots/doctor-list.png](https://github.com/yhrabhishek007/DoctorPortal/blob/0b3a800d29c7e1d7de2e7721ea984367355bd1e8/Screenshot%202026-11-06%20231550.png))

### Add Doctor
[Add Doctor]([screenshots/add-doctor.png](https://github.com/yhrabhishek007/DoctorPortal/blob/0b3a800d29c7e1d7de2e7721ea984367355bd1e8/Screenshot%202026-11-06%20231512.png))

### Edit Doctor
[Edit Doctor]([screenshots/edit-doctor.png](https://github.com/yhrabhishek007/DoctorPortal/blob/0b3a800d29c7e1d7de2e7721ea984367355bd1e8/Screenshot%202026-11-09%20100845.png))

### Delete Doctor
[Delete Doctor]([screenshots/delete-doctor.png](https://github.com/yhrabhishek007/DoctorPortal/blob/0b3a800d29c7e1d7de2e7721ea984367355bd1e8/Screenshot%202026-11-09%20100945.png))

---

## 🎯 Learning Outcomes

While developing DoctorPortal, I gained practical experience in:

- Understanding the Spring MVC request-response lifecycle.
- Implementing the MVC architecture in a Java web application.
- Working with Controllers, Models, JSP, and DAO classes.
- Connecting a Java application to MySQL using JDBC.
- Implementing CRUD operations.
- Passing data between controllers and JSP views.
- Handling HTTP requests and form submissions.
- Implementing search and filtering functionality.
- Managing a Java web project using Eclipse and Apache Tomcat.
- Publishing a project using Git and GitHub.

---

## 🚀 Future Enhancements

The following features can be added in future versions:

- Pagination for doctor records.
- Doctor profile details page.
- Form validation and improved error handling.
- Confirmation dialog before deleting a doctor.
- Success and error notifications.
- Dashboard summary cards.
- CSV export of doctor records.
- Improved responsive user interface.

---

## 👨‍💻 Author

**Abhishek**

Java Backend Developer | Spring MVC | JDBC | MySQL

GitHub: [yhrabhishek007](https://github.com/yhrabhishek007)

---

## 📄 License

This project is developed for learning and portfolio purposes.
