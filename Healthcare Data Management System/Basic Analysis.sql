--  Retrieve the names and genders of all patients.
SELECT patient_name, gender
FROM Patients;

-- List the unique diagnoses recorded in the medical records.

SELECT DISTINCT diagnosis
FROM MedicalRecords;

--  Count the total number of patients in the database.

SELECT COUNT(*) AS total_patients
FROM Patients;

--  Find the oldest patient in the database.

SELECT patient_name, date_of_birth
FROM Patients
ORDER BY date_of_birth
LIMIT 1;

-- Display the address and phone number of patient with ID 7.

SELECT address, phone_number
FROM Patients
WHERE patient_id = 7;

-- Retrieve the names and specializations of all doctors.
SELECT doctor_name, specialization
FROM Doctors;

-- Calculate the average length of hospital stay for all patients.

SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM MedicalRecords;

-- Count the number of male and female patients separately.

SELECT gender, COUNT(*) AS total_count
FROM Patients
GROUP BY gender;

--  Find the doctor who treated the most patients.

SELECT doctor_id, COUNT(*) AS patient_count
FROM MedicalRecords
GROUP BY doctor_id
ORDER BY patient_count DESC
LIMIT 1;

--  List all patients whose names start with 'J'.
SELECT *
FROM Patients
WHERE patient_name LIKE 'J%';

-- Retrieve the names of patients along with their admission and discharge dates.

SELECT p.patient_name, m.admission_date, m.discharge_date
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id;

-- Calculate the total number of medical records in the database.
SELECT COUNT(*) AS total_medical_records
FROM MedicalRecords;

-- List the patients who were diagnosed with hypertension or diabetes.
SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
WHERE m.diagnosis IN ('Hypertension', 'Diabetes');

select * from MedicalRecords;

-- Find the average age of patients in the database.
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(date_of_birth)) AS avg_age
FROM Patients;

-- Display the doctors who treated patients admitted in January 2023.
SELECT DISTINCT d.*
FROM Doctors d
INNER JOIN MedicalRecords m ON d.doctor_id = m.doctor_id
WHERE YEAR(m.admission_date) = 2023 AND MONTH(m.admission_date) = 1;

-- Calculate the total number of patients treated by each doctor.
SELECT doctor_id, COUNT(*) AS total_patients_treated
FROM MedicalRecords
GROUP BY doctor_id;

-- List the patients who were treated by doctors specializing in Cardiology.

SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
INNER JOIN Doctors d ON m.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiology';

SELECT * FROM MedicalRecords;
SELECT * FROM Doctors;
SELECT * FROM Patients;

-- Find the patient with the longest hospital stay duration.
SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
ORDER BY DATEDIFF(m.discharge_date, m.admission_date) DESC
LIMIT 1;

--  Display the top 5 most common diagnoses recorded in the medical records.

SELECT diagnosis, COUNT(*) AS diagnosis_count
FROM MedicalRecords
GROUP BY diagnosis
ORDER BY diagnosis_count DESC
LIMIT 5;

--  List the patients who were treated by doctors with names starting with 'Dr. S'.
SELECT p.*
FROM Patients p
INNER JOIN MedicalRecords m ON p.patient_id = m.patient_id
INNER JOIN Doctors d ON m.doctor_id = d.doctor_id
WHERE d.doctor_name LIKE 'Dr. S%';