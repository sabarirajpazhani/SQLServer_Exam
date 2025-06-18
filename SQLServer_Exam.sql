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


--Q2
--Normalizating the table
-- | OrderID | CustomerName | Product1 | Product2 | Product3 | Address | TotalAmount | 

create table Customers (	
	CustomerID int identity(101,1) primary key,
	CustomerName varchar(80),
	CustomerEmail Varchar(90),
	CustomerPhone varchar (20),
	AddressID int,
	foreign key (AddressID) references Addresses(AddressID)
);

create table Addresses(
	AddressID int identity(201,1) primary key,
	StreetName varchar(80),
	CityAndPostalCodeID int,
	Foreign key (CityAndPostalCodeID) references CityAndPostal(CityAndPostalCodeID)
);

create table CityAndPostal(
	CityAndPostalCodeID int identity(301,1) primary key,
	CityName varchar(70),
	PostalCode int
);

create table Products (
	ProductID int identity(301,1) primary key,
	ProductName varchar(80),
	Prices decimal(10,2)
);

create table Orders(
	OrderID int identity(401,1) primary key,
	CustomerID int,
	OrderDate date,
	TotalAmount decimal(10,2),
	foreign key (CustomerID) references Customers(CustomerID)
);

create table OrderDetails(
	OrderDetailsID int identity(501,1) primary key,
	OrderID int,
	ProductID int,
	SubPrice decimal(10,2),
	foreign key (OrderID) references Orders(OrderID),
	foreign key (ProductID) references Products(ProductID)
);


--Section B
--Q3
--Sample table
create table Orders1(
	CustomerID int,
	OrderDate date
);
insert into Orders1 values
(1, '2025-01-05'),
(1, '2025-02-10'),
(1, '2025-03-12'),
(1, '2025-04-09'),
(1, '2025-05-15'),
(1, '2025-06-01'),
(2, '2025-01-15'),
(2, '2025-02-20'),
(2, '2025-03-18'),
(2, '2025-04-10'),
(2, '2025-05-22'),
(3, '2025-02-11'),
(3, '2025-03-11'),
(3, '2025-04-11'),
(3, '2025-05-11'),
(3, '2025-06-11');


select CustomerID from Orders1 
where datediff(MONTH,OrderDate, Getdate()) <=6
group by CustomerID
having Count(distinct month(OrderDate)) = 6

