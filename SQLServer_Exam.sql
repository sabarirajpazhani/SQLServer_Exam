create database Exam
use Exam;
--Section - A
--Q1
create table Patients(	
	PatientID int identity(101, 1) primary key,
	PatientName varchar(80),
	PatientEmail varchar(90) unique,
	PatientAge int,
	PatientPhone varchar(20) unique
);

create table Doctors (
	DoctorID int identity(201, 1) primary key,
	DoctorName varchar(80),
	DoctorEmail varchar(90) unique,
	DepartmentID int,
	DoctorPhone varchar(90) unique
	foreign key (DepartmentID) references Departments (DepartmentID)
);

create table Departments (
	DepartmentID int identity(301, 1) primary key,
	DepartmentName varchar(70)
);

create table Specialization (
	SpecializationID int identity(401,1) primary key,
	DoctorID int,
	DepartmentID int, 
	unique(DoctorID, DepartmentID),
	foreign key (DoctorID) references Doctors(DoctorID),
	foreign key (DepartmentID ) references Departments(DepartmentID)
);

create table Appointments (
	AppointmentID int identity(501,1) primary key,
	PatientID int, 
	DoctorID int,
	AppointmentDate date,
	AppointmentTime time,
	Status varchar(30),
	foreign key (PatientID) references Patients(PatientID),
	foreign key (DoctorID) references Doctors(DoctorID)
);

create index ix_IndexForPatientname on Patients (PatientName) include (PatientEmail, PatientPhone)