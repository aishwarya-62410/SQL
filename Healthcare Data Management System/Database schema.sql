create database healthcare_management;
use healthcare_management;

-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(255),
    date_of_birth DATE,
    gender VARCHAR(10),
    address VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Insert values into Patients Table
INSERT INTO Patients (patient_id, patient_name, date_of_birth, gender, address, phone_number) VALUES
(1, 'John Smith', '1980-05-15', 'Male', '123 Main St, Anytown', '123-456-7890'),
(2, 'Emily Brown', '1975-09-20', 'Female', '456 Elm St, Anytown', '234-567-8901'),
(3, 'David Johnson', '1992-02-10', 'Male', '789 Oak St, Anytown', '345-678-9012'),
(4, 'Sarah Adams', '1988-07-12', 'Female', '567 Maple St, Anytown', '456-789-0123'),
(5, 'Michael Clark', '1970-03-25', 'Male', '890 Pine St, Anytown', '567-890-1234'),
(6, 'Jessica White', '1985-11-30', 'Female', '678 Cedar St, Anytown', '678-901-2345'),
(7, 'Robert Taylor', '1995-01-05', 'Male', '901 Oakwood St, Anytown', '789-012-3456'),
(8, 'Jennifer Lee', '1982-08-18', 'Female', '234 Cedar Lane, Anytown', '890-123-4567'),
(9, 'Christopher Brown', '1978-06-23', 'Male', '345 Oak Lane, Anytown', '901-234-5678'),
(10, 'Amanda Wilson', '1990-04-17', 'Female', '456 Pine Lane, Anytown', '012-345-6789'),
(11, 'Daniel Martinez', '1983-09-03', 'Male', '567 Maple Lane, Anytown', '123-456-7890'),
(12, 'Ashley Harris', '1993-12-28', 'Female', '678 Cedar Lane, Anytown', '234-567-8901'),
(13, 'Matthew Thompson', '1976-02-14', 'Male', '789 Oakwood Lane, Anytown', '345-678-9012'),
(14, 'Elizabeth Rodriguez', '1987-10-09', 'Female', '890 Elm Lane, Anytown', '456-789-0123'),
(15, 'Kevin Wright', '1981-05-22', 'Male', '901 Pine Lane, Anytown', '567-890-1234'),
(16, 'Samantha King', '1974-08-07', 'Female', '123 Cedar Lane, Anytown', '678-901-2345'),
(17, 'Joshua Scott', '1994-03-12', 'Male', '234 Oakwood Lane, Anytown', '789-012-3456'),
(18, 'Lauren Turner', '1986-11-19', 'Female', '345 Maple Lane, Anytown', '890-123-4567'),
(19, 'Justin Hall', '1977-07-02', 'Male', '456 Pine Lane, Anytown', '901-234-5678'),
(20, 'Megan Baker', '1991-01-15', 'Female', '567 Elm Lane, Anytown', '012-345-6789');


-- Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(255),
    specialization VARCHAR(255),
    department VARCHAR(255)
);

-- Insert values into Doctors Table
INSERT INTO Doctors (doctor_id, doctor_name, specialization, department) VALUES
(201, 'Dr. Sarah Jones', 'Pulmonology', 'Internal Medicine'),
(202, 'Dr. Michael Lee', 'Endocrinology', 'Endocrinology'),
(203, 'Dr. Linda Smith', 'Cardiology', 'Cardiology'),
(204, 'Dr. Christopher Brown', 'Neurology', 'Neurology'),
(205, 'Dr. Jennifer Taylor', 'Pediatrics', 'Pediatrics'),
(206, 'Dr. Robert Johnson', 'Oncology', 'Oncology'),
(207, 'Dr. Amanda Martinez', 'Dermatology', 'Dermatology'),
(208, 'Dr. David Wilson', 'Gastroenterology', 'Gastroenterology'),
(209, 'Dr. Samantha Miller', 'Rheumatology', 'Rheumatology'),
(210, 'Dr. Daniel Thomas', 'Nephrology', 'Nephrology'),
(211, 'Dr. Emily Harris', 'Psychiatry', 'Psychiatry'),
(212, 'Dr. Matthew Adams', 'Urology', 'Urology'),
(213, 'Dr. Lauren Scott', 'Ophthalmology', 'Ophthalmology'),
(214, 'Dr. Justin Turner', 'Orthopedics', 'Orthopedics'),
(215, 'Dr. Ashley King', 'Geriatrics', 'Geriatrics'),
(216, 'Dr. Megan Clark', 'Pulmonology', 'Internal Medicine'),
(217, 'Dr. Kevin White', 'Endocrinology', 'Endocrinology'),
(218, 'Dr. Samantha Garcia', 'Cardiology', 'Cardiology'),
(219, 'Dr. Joshua Martin', 'Neurosurgery', 'Neurosurgery'),
(220, 'Dr. Elizabeth Baker', 'Oncology', 'Oncology');

-- Create Medical Records Table
CREATE TABLE MedicalRecords (
    record_id INT PRIMARY KEY,
    patient_id INT,
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Insert values into Medical Records Table
INSERT INTO MedicalRecords (record_id, patient_id, admission_date, discharge_date, diagnosis, treatment, doctor_id) VALUES
(101, 1, '2023-01-05', '2023-01-10', 'Pneumonia', 'Antibiotics', 201),
(102, 2, '2023-02-10', '2023-02-15', 'Diabetes', 'Insulin therapy', 202),
(103, 3, '2023-03-20', '2023-03-25', 'Hypertension', 'ACE inhibitors', 203),
(104, 4, '2023-04-12', '2023-04-20', 'Influenza', 'Antiviral medication', 201),
(105, 5, '2023-05-08', '2023-05-15', 'Asthma', 'Bronchodilators', 202),
(106, 6, '2023-06-18', '2023-06-25', 'Arthritis', 'NSAIDs', 203),
(107, 7, '2023-07-03', '2023-07-10', 'Migraine', 'Triptans', 201),
(108, 8, '2023-08-25', '2023-09-02', 'Depression', 'SSRI', 202),
(109, 9, '2023-09-10', '2023-09-18', 'Anxiety', 'Benzodiazepines', 203),
(110, 10, '2023-10-22', '2023-10-30', 'Allergies', 'Antihistamines', 201),
(111, 11, '2023-11-05', '2023-11-12', 'Gastritis', 'Proton pump inhibitors', 202),
(112, 12, '2023-12-15', '2023-12-22', 'COPD', 'Bronchodilators', 203),
(113, 13, '2024-01-02', '2024-01-09', 'Insomnia', 'Sedatives', 201),
(114, 14, '2024-02-08', '2024-02-15', 'Osteoporosis', 'Bisphosphonates', 202),
(115, 15, '2024-03-17', '2024-03-24', 'Thyroid disorder', 'Thyroid hormone therapy', 203),
(116, 16, '2024-04-09', '2024-04-16', 'Sinusitis', 'Decongestants', 201),
(117, 17, '2024-05-23', '2024-05-30', 'Hypothyroidism', 'Levothyroxine', 202),
(118, 18, '2024-06-30', '2024-07-07', 'Eczema', 'Topical corticosteroids', 203),
(119, 19, '2024-07-14', '2024-07-21', 'Psoriasis', 'Phototherapy', 201),
(120, 20, '2024-08-26', '2024-09-02', 'Obesity', 'Diet and exercise', 202);

