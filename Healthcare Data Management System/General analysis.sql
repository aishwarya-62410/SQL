-- Male vs. Female Patients:
SELECT gender, COUNT(*) AS total_count FROM Patients GROUP BY gender;

-- Percentage of Male and Female Patients:

SELECT gender, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patients) AS percentage FROM Patients GROUP BY gender;

-- Top 5 Most Common Diagnoses:

SELECT diagnosis, COUNT(*) AS diagnosis_count FROM MedicalRecords GROUP BY diagnosis ORDER BY diagnosis_count DESC LIMIT 5;

-- Average Length of Hospital Stay:

SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay FROM MedicalRecords;

-- Top 3 Doctors Treating the Most Patients:

SELECT doctor_id, COUNT(*) AS patient_count FROM MedicalRecords GROUP BY doctor_id ORDER BY patient_count DESC LIMIT 3;

-- Doctors Treating Patients with Diabetes:

SELECT m.doctor_id, d.doctor_name, COUNT(*) AS diabetes_patients 
FROM MedicalRecords m JOIN Doctors d ON m.doctor_id = d.doctor_id 
WHERE m.diagnosis = 'Diabetes' 
GROUP BY m.doctor_id, d.doctor_name 
ORDER BY diabetes_patients DESC 
LIMIT 1;

-- Readmission Rate within 30 Days:
SELECT m1.patient_id, p.patient_name, m1.admission_date AS readmission_date, 
m1.discharge_date AS readmission_discharge_date, m2.admission_date AS previous_admission_date 
FROM MedicalRecords m1 JOIN MedicalRecords m2 ON m1.patient_id = m2.patient_id AND m1.admission_date > m2.discharge_date 
AND DATEDIFF(m1.admission_date, m2.discharge_date) <= 30 
JOIN Patients p ON m1.patient_id = p.patient_id ORDER BY m1.patient_id, m1.admission_date;

