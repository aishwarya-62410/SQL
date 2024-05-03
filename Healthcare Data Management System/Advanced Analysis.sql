--  Calculate the percentage of male and female patients in the database.
SELECT 
    gender,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patients) AS percentage
FROM 
    Patients
GROUP BY 
    gender;
    
SELECT * FROM Patients;

--  Find the patient with the highest number of medical records.

SELECT 
    patient_id,
    COUNT(*) AS record_count
FROM 
    MedicalRecords
GROUP BY 
    patient_id
ORDER BY 
    record_count DESC
LIMIT 1;

--  List the top 3 doctors who treated the most patients.

SELECT 
    doctor_id,
    COUNT(*) AS patient_count
FROM 
    MedicalRecords
GROUP BY 
    doctor_id
ORDER BY 
    patient_count DESC
LIMIT 3;

--  Calculate the average length of hospital stay for each diagnosis.
SELECT 
    diagnosis,
    AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM 
    MedicalRecords
GROUP BY 
    diagnosis;

-- Rank patients based on the number of medical records they have, from highest to lowest.
SELECT 
    patient_id,
    COUNT(*) AS record_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS record_rank
FROM 
    MedicalRecords
GROUP BY 
    patient_id;
    
-- 26. Display the patient who spent the most time in the hospital.
SELECT 
    p.patient_id,
    p.patient_name,
    DATEDIFF(MAX(m.discharge_date), MIN(m.admission_date)) AS total_days
FROM 
    Patients p
JOIN 
    MedicalRecords m ON p.patient_id = m.patient_id
GROUP BY 
    p.patient_id, p.patient_name
ORDER BY 
    total_days DESC
LIMIT 1;

--  List the patients who were treated by doctors specializing in Cardiology or Pulmonology.

SELECT 
    p.*
FROM 
    Patients p
JOIN 
    MedicalRecords m ON p.patient_id = m.patient_id
JOIN 
    Doctors d ON m.doctor_id = d.doctor_id
WHERE 
    d.specialization IN ('Cardiology', 'Pulmonology');

--  Find the doctor who treated the most patients diagnosed with Diabetes.
SELECT 
    m.doctor_id,
    d.doctor_name,
    COUNT(*) AS diabetes_patients
FROM 
    MedicalRecords m
JOIN 
    Doctors d ON m.doctor_id = d.doctor_id
WHERE 
    m.diagnosis = 'Diabetes'
GROUP BY 
    m.doctor_id, d.doctor_name
ORDER BY 
    diabetes_patients DESC
LIMIT 1;

--  Calculate the total number of patients treated by each doctor, including those with no patients.
SELECT 
    d.doctor_id,
    d.doctor_name,
    COUNT(m.patient_id) AS patient_count
FROM 
    Doctors d
LEFT JOIN 
    MedicalRecords m ON d.doctor_id = m.doctor_id
GROUP BY 
    d.doctor_id, d.doctor_name;

-- inserting data

INSERT INTO MedicalRecords (record_id, patient_id, admission_date, discharge_date, diagnosis, treatment, doctor_id) VALUES
(121, 1, '2024-01-15', '2024-01-20', 'Pneumonia', 'Antibiotics', 201),
(122, 1, '2024-02-10', '2024-02-15', 'Pneumonia', 'Antibiotics', 201),
(123, 2, '2024-03-20', '2024-03-25', 'Diabetes', 'Insulin therapy', 202),
(124, 2, '2024-04-12', '2024-04-15', 'Diabetes', 'Insulin therapy', 202),
(125, 3, '2024-05-08', '2024-05-15', 'Asthma', 'Bronchodilators', 202),
(126, 3, '2024-06-18', '2024-06-20', 'Asthma', 'Bronchodilators', 202),
(127, 4, '2024-07-03', '2024-07-10', 'Migraine', 'Triptans', 203),
(128, 4, '2024-07-25', '2024-07-30', 'Migraine', 'Triptans', 203);


--  Identify patients who have been readmitted within 30 days of discharge:
SELECT 
    m1.patient_id,
    p.patient_name,
    m1.admission_date AS readmission_date,
    m1.discharge_date AS readmission_discharge_date,
    m2.admission_date AS previous_admission_date
FROM 
    MedicalRecords m1
JOIN 
    MedicalRecords m2 ON m1.patient_id = m2.patient_id
    AND m1.admission_date > m2.discharge_date
    AND DATEDIFF(m1.admission_date, m2.discharge_date) <= 30
JOIN 
    Patients p ON m1.patient_id = p.patient_id
ORDER BY 
    m1.patient_id, m1.admission_date;

--  Calculate the average length of hospital stay by month for the past year:
SELECT 
    YEAR(admission_date) AS year,
    MONTH(admission_date) AS month,
    AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM 
    MedicalRecords
WHERE 
    admission_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY 
    YEAR(admission_date), MONTH(admission_date)
ORDER BY 
    year, month;

--  List patients who have been admitted to the hospital more than once in the past year:
SELECT 
    Patients.patient_id,
    Patients.patient_name,
    COUNT(*) AS admissions
FROM 
    MedicalRecords
JOIN 
    Patients ON MedicalRecords.patient_id = Patients.patient_id
WHERE 
    MedicalRecords.admission_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY 
    Patients.patient_id, Patients.patient_name
HAVING 
    COUNT(*) > 1;

--  Find patients whose total hospital charges exceed a certain threshold:
SELECT 
    Patients.patient_id,
    Patients.patient_name,
    SUM(MedicalRecords.hospital_charges) AS total_charges
FROM 
    MedicalRecords
JOIN 
    Patients ON MedicalRecords.patient_id = Patients.patient_id
GROUP BY 
    Patients.patient_id, Patients.patient_name
HAVING 
    total_charges > 100;


--  Calculate the percentage change in the number of patients admitted each month compared to the previous month:

SELECT 
    YEAR(admission_date) AS year,
    MONTH(admission_date) AS month,
    COUNT(*) AS admissions,
    ((COUNT(*) - LAG(COUNT(*), 1, 0) OVER (ORDER BY YEAR(admission_date), MONTH(admission_date))) * 100.0) / LAG(COUNT(*), 1, 1) OVER (ORDER BY YEAR(admission_date), MONTH(admission_date)) AS percentage_change
FROM 
    MedicalRecords
WHERE 
    admission_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY 
    YEAR(admission_date), MONTH(admission_date);
