--Problem Statement:
A hospital wants to implement a Patient Management System to efficiently manage patient
records, doctor appointments, treatment history, and hospital performance metrics. The system should allow for the storage of electronic health records (EHR), patient demographics, medical diagnoses, treatment history, and doctor information. Additionally, it should support analysis of patient demographics, disease prevalence, treatment outcomes, and hospital performance metrics.

--Solution:
•Design and implemented a relational database system to store patient and doctor information, medical records, and treatment details. 
•prepared SQL queries to perform various analyses such as patient demographics, disease prevalence, treatment outcomes, and hospital performance metrics.

--Database Schema:
1.Patients: Stores patient demographics.
2.Doctors: Stores doctor information and specialization.
3.MedicalRecords: Stores medical records, including admission dates, discharge dates, diagnoses, treatments, and associated doctor IDs.

--Detailed Data Schema:
**Patients Table:
patient_id (Primary Key)
patient_name
date_of_birth
gender
address
phone_number


**Doctors Table:
doctor_id (Primary Key)
doctor_name
specialization
department

**Medical Records Table:
record_id (Primary Key)
patient_id (Foreign Key referencing Patients)
admission_date
discharge_date
diagnosis
treatment
doctor_id
