create table ApplicantDetails(user_id int identity(1001,1) primary key,f_name varchar(20),m_name varchar(20),l_Name varchar(20),
DOB Date,gender varchar(10),mob varchar(20), email varchar(40),applicant_address_line1 varchar(100),applicant_address_line2 varchar(100),
res_state varchar(40),
 city varchar(40),pincode varchar(20),landmark varchar(50),
emp_type varchar(50),yearly_salary varchar(40),other_income varchar(20),maritial_status varchar(10),
admin_login_id varchar(40) constraint fkloandetails2 foreign key references Bank_Admin(admin_login_id))



create table Document_Upload(user_id int constraint fkdocumentupload1 foreign key references ApplicantDetails(user_id),photo varbinary(max),
aadhar_card varbinary(max),pan_card varbinary(max),salary_slip varbinary(max),
admin_login_id varchar(40) constraint fkdocumentupload2 foreign key references Bank_Admin(admin_login_id))
alter table Document_Upload
drop constraint fkdocumentupload2
alter table Existing_Loan
drop constraint fkexisting_loans2
alter table  VehicalDetails
drop constraint fkvehicaldetails2
alter table  LoanDetails
drop constraint fkloandetails3

alter table  LoanDetails
drop column admin_login_id
alter table  Existing_Loan
drop column admin_login_id
alter table  VehicalDetails
drop column admin_login_id
alter table Document_Upload
drop column admin_login_id


create table Existing_Loan(user_id int constraint fkexisting_loan1 foreign key references ApplicantDetails(user_id),
emi_id int identity(1,1),exising_loanamt varchar(20),
existing_emi varchar(20),exisitng_emi_month_left int,existing_emi_interest float, 
admin_login_id varchar(40) constraint fkexisting_loans2 foreign key references Bank_Admin(admin_login_id))


 create table VehicalDetails(user_id int constraint fkVehicalDetails1 foreign key references ApplicantDetails(user_id),vehical_id varchar(20) primary key,car_make 
 varchar(40),car_model varchar(20),Ex_showroom_price varchar(20),onroad_price varchar(20),
 admin_login_id varchar(40) constraint fkvehicaldetails2 foreign key references Bank_Admin(admin_login_id))

  create table LoanDetails(user_id int constraint fkloandetails1 foreign key references ApplicantDetails(user_id),loan_id varchar(10) primary key,loan_amt
 varchar(20),loan_tenure varchar(20),loan_intrest float,loan_emi varchar(10),
)
alter table LoanDetails
add loan_start_date date

 drop table UserRegistration
 Create table UserRegistration(Firstname varchar(20),Middlename varchar(20),LastName varchar(20),EmailId varchar(20) primary key,Mobile varchar(20),
 DOB date,pass varchar(20),admin_login_id varchar(40) constraint fkuserreg foreign key references Bank_Admin(admin_login_id))

  create table Bank_Admin(admin_login_id varchar(40) primary key,pass varchar(20))
  create table Track_Application(loan_id varchar(10) constraint fktrackapp1 foreign key references LoanDetails(loan_id),admin_login_id varchar(40) constraint fktrackapp2 foreign key references Bank_Admin(admin_login_id),loan_status varchar(10))

