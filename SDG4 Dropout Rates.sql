CREATE SCHEMA IF NOT EXISTS SDG4_Dropouts_Analysis;
USE SDG4_Dropouts_Analysis;

CREATE TABLE Regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(100),
    infrastructure TEXT, -- Roads, schools, laboratories, etc.
    access_to_water BOOLEAN,
    access_to_food BOOLEAN,
    access_to_housing BOOLEAN,
    employment_rate DECIMAL(5,2) -- Percentage employment rate
);

CREATE TABLE Schools (
    school_id INT PRIMARY KEY,
    name VARCHAR(100),
    region_id INT,
    resources TEXT, -- Number of books, computers, labs, etc.
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

-- REMOVING THE RESOURCES COLUMN IN THE SCHOOLS TABLE
ALTER TABLE schools
DROP COLUMN resources;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender ENUM('Male', 'Female'),
    age INT,
    school_id INT,
    year_in_school VARCHAR(50),
    performance DECIMAL(5,2), -- GPA or performance score
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

CREATE TABLE Dropouts (
    dropout_id INT PRIMARY KEY,
    student_id INT,
    dropout_date DATE,
    dropout_reason ENUM('Poverty', 'Early Marriage', 'Death of Parent', 'Change of Interest'),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    name VARCHAR(100),
    school_id INT,
    subjects_taught TEXT,
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

CREATE TABLE Resources (
    resource_id INT PRIMARY KEY,
    school_id INT,
    resource_type VARCHAR(50), -- Books, Computers, Labs
    quantity INT,
    cost DECIMAL(10,2),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);


-- ADDING DATA INTO THE TABLES
-- ADDING DATA INTO THE REGIONS TABLE
INSERT INTO Regions (region_id, region_name, infrastructure, access_to_water, access_to_food, access_to_housing, employment_rate) VALUES
(1, 'Urban', 'Paved roads, Modern schools, Labs', TRUE, TRUE, TRUE, 75.50),
(2, 'Rural', 'Gravel roads, Few schools, Limited labs', TRUE, TRUE, FALSE, 40.75),
(3, 'Marginalized', 'No roads, Limited schools, No labs', FALSE, FALSE, FALSE, 20.30);

-- ADDING DATA INTO THE SCHOOLS TABLE
INSERT INTO Schools (school_id, name, region_id) VALUES 
(1, 'School A', 1), 
(2, 'School B', 1), 
(3, 'School C', 1), 
(4, 'School D', 2), 
(5, 'School E', 2), 
(6, 'School F', 2), 
(7, 'School G', 3), 
(8, 'School H', 3), 
(9, 'School I', 3);

-- ADDING DATA INTO THE STUDENTS TABLE
INSERT INTO Students (student_id, name, gender, age, school_id, year_in_school, performance) VALUES 
(1, 'Alice', 'Female', 16, 1, 'Sophomore', 85.50),
(2, 'Bob', 'Male', 17, 1, 'Junior', 70.25),
(3, 'Charlie', 'Male', 15, 1, 'Freshman', 60.00),
(4, 'Jane', 'Female', 16, 1, 'Sophomore', 90.75),
(5, 'Imma', 'Female', 18, 1, 'Senior', 88.00),
(6, 'Jack', 'Male', 17, 2, 'Junior', 55.25),
(7, 'Morris', 'Male', 16, 2, 'Sophomore', 65.50),
(8, 'Carol', 'Female', 17, 2, 'Senior', 72.00),
(9, 'Ofweneke', 'Male', 15, 2, 'Freshman', 60.75),
(10, 'Kwach', 'Male', 18, 3, 'Senior', 75.00),
(11, 'Raila', 'Male', 16, 4, 'Sophomore', 78.25),
(12, 'Uhuru', 'Male', 17, 4, 'Junior', 65.50),
(13, 'Alice', 'Female', 15, 4, 'Freshman', 89.75),
(14, 'Jackson', 'Male', 18, 4, 'Senior', 72.00),
(15, 'Janey', 'Female', 17, 4, 'Junior', 85.25),
(16, 'Ann', 'Female', 16, 5, 'Sophomore', 90.50),
(17, 'Charles', 'Male', 17, 5, 'Junior', 58.25),
(18, 'Kwachanga', 'Male', 16, 5, 'Sophomore', 65.00),
(19, 'Owen', 'Male', 18, 5, 'Senior', 70.75),
(20, 'Caroline', 'Female', 15, 5, 'Freshman', 92.50),
(21, 'Butita', 'Male', 17, 6, 'Junior', 63.00),
(22, 'Kingori', 'Male', 18, 6, 'Senior', 78.50),
(23, 'Morris', 'Male', 15, 6, 'Freshman', 69.25),
(24, 'Jackie', 'Female', 16, 6, 'Sophomore', 81.00),
(25, 'Jacey', 'Female', 17, 6, 'Junior', 87.75),
(26, 'Alison', 'Female', 16, 7, 'Sophomore', 92.00),
(27, 'Robert', 'Male', 18, 7, 'Senior', 59.75),
(28, 'Raphael', 'Male', 17, 7, 'Junior', 70.50),
(29, 'Mark', 'Male', 15, 7, 'Freshman', 68.00),
(30, 'Scarlet', 'Female', 17, 7, 'Senior', 88.50),
(31, 'Uhunye', 'Male', 16, 8, 'Sophomore', 60.25),
(32, 'Rao', 'Male', 17, 8, 'Junior', 66.75),
(33, 'Jane', 'Female', 18, 8, 'Senior', 91.00),
(34, 'Ann', 'Female', 15, 8, 'Freshman', 85.25),
(35, 'James', 'Male', 17, 8, 'Junior', 72.50),
(36, 'Owenek', 'Male', 16, 9, 'Sophomore', 75.25),
(37, 'Hailey', 'Female', 17, 9, 'Junior', 92.50),
(38, 'Eddie', 'Male', 18, 9, 'Senior', 68.00),
(39, 'Faith', 'Female', 15, 9, 'Freshman', 85.75),
(40, 'Joseph', 'Male', 17, 9, 'Junior', 70.50),
(41, 'Bram', 'Male', 18, 3, 'Senior', 71.00),
(42, 'Kasandra', 'Female', 17, 3, 'Junior', 85.00),
(43, 'Brayo', 'Male', 16, 3, 'Sophomore', 86.00);

-- Update performance for schools in the marginalized region to be the lowest
UPDATE Students
SET performance = performance - 10
WHERE school_id IN (
    SELECT school_id
    FROM Schools
    WHERE region_id = 3
);
-- Update performance for schools in the rural region to be higher than marginalized
UPDATE Students
SET performance = performance + 5
WHERE school_id IN (
    SELECT school_id
    FROM Schools
    WHERE region_id = 2
);
-- Update performance for schools in the urban region to be the highest
UPDATE Students
SET performance = performance + 10
WHERE school_id IN (
    SELECT school_id
    FROM Schools
    WHERE region_id = 1
);

-- ADDING DATA INTO THE TEACHERS TABLE
INSERT INTO Teachers (teacher_id, name, school_id, subjects_taught) VALUES 
(1, 'Mr. Kelvin', 1, 'Mathematics, Physics'),
(2, 'Ms. Carol', 1, 'English, History'),
(3, 'Mr. Tom', 2, 'Biology, Chemistry'),
(4, 'Ms. Jackie', 2, 'Mathematics, Geography'),
(5, 'Mr. Mutua', 3, 'Physics, Chemistry'),
(6, 'Ms. Jane', 3, 'History, Geography'),
(7, 'Mr. Saruni', 4, 'Mathematics, Biology'),
(8, 'Ms. Jane', 4, 'English, Geography'),
(9, 'Mr. Kabi', 5, 'Physics, Chemistry'),
(10, 'Ms. Diana', 5, 'History, Geography'),
(11, 'Mr. Bahati', 6, 'Mathematics, Physics'),
(12, 'Ms. Kwamboka', 6, 'English, History'),
(13, 'Mr. Jimmy', 7, 'Biology, Chemistry'),
(14, 'Ms. Rachel', 7, 'Geography, Mathematics'), 
(15, 'Mr. Mwangi', 8, 'Physics, Chemistry'),
(16, 'Ms. Wairimu', 8, 'History, Geography'),
(17, 'Mr. Muthee', 9, 'Mathematics, Physics'),
(18, 'Ms. Tabby', 9, 'English, History');

-- ADDING DATA INTO THE DROPOUTS TABLE
INSERT INTO Dropouts (dropout_id, student_id, dropout_date, dropout_reason) VALUES 
(1, 1, '2024-05-08', 'Poverty'),
(8, 7, '2024-05-08', 'Change of Interest'),
(2, 34, '2024-01-2', 'Early Marriage'),
(3, 5, '2024-07-10', 'Change of Interest'),
(4, 6, '2024-08-01', 'Death of Parent'), 
(5, 31, '2024-05-08', 'Poverty'),
(6, 26, '2023-06-20', 'Early Marriage'),
(7, 33, '2024-08-26', 'Early Marriage');

-- Updating data in the Dropouts table
UPDATE Dropouts
SET student_id = 18, dropout_date = '2024-07-10', dropout_reason = 'Change of Interest'
WHERE dropout_id = 3;

UPDATE Dropouts
SET student_id = 24, dropout_date = '2024-08-01', dropout_reason = 'Death of Parent'
WHERE dropout_id = 4;


-- ADDING DATA INTO THE RESOURCES TABLE
INSERT INTO Resources (resource_id, school_id, resource_type, quantity, cost) VALUES 
(1, 1, 'Books', 300, 15000),
(2, 1, 'Computers', 50, 50000),
(3, 1, 'Laboratories', 2, 200000),
(4, 1, 'Mentorship', 1, 50000),
(5, 2, 'Books', 100, 5000),
(6, 2, 'Computers', 100, 100000),
(7, 2, 'Laboratories', 100, 10000000),
(8, 2, 'Mentorship', 1, 50000),
(9, 3, 'Books', 80, 320000),
(10, 3, 'Computers', 80, 80000),
(11, 3, 'Laboratories', 80, 8000000),
(12, 3, 'Mentorship', 2, 100000),
(13, 4, 'Books', 150, 7500),
(14, 4, 'Computers', 40, 40000),
(15, 4, 'Laboratories', 1, 100000),
(16, 4, 'Mentorship', 1, 50000),
(17, 5, 'Books', 100, 5000),
(18, 5, 'Computers', 30, 30000),
(19, 5, 'Laboratories', 2, 200000),
(20, 5, 'Mentorship', 1, 50000),
(21, 6, 'Books', 200, 10000),
(22, 6, 'Computers', 50, 50000),
(23, 6, 'Laboratories', 2, 200000),
(24, 6, 'Mentorship', 0, 0), 
(25, 7, 'Books', 120, 6000),
(26, 7, 'Computers', 25, 25000),
(27, 7, 'Laboratories', 1, 100000),
(28, 7, 'Mentorship', 0, 0),
(29, 8, 'Books', 80, 4000),
(30, 8, 'Computers', 20, 20000),
(31, 8, 'Laboratories', 1, 100000), 
(32, 8, 'Mentorship', 0, 0),
(33, 9, 'Books', 50, 2500),
(34, 9, 'Computers', 0, 0),
(35, 9, 'Laboratories', 1, 100000),
(36, 9, 'Mentorship', 0, 0);


-- DATA ANALYSIS AND RETRIEVAL
-- Region with the Highest School Performance
SELECT r.region_name, AVG(st.performance) AS avg_performance
FROM Schools s
JOIN Students st ON s.school_id = st.school_id
JOIN Regions r ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY avg_performance;

-- Region with the Highest Resources
-- Total resources per school including cost and quantity of each resource type
SELECT
    s.school_id,
    s.name AS school_name,
    r.resource_type,
    SUM(r.quantity) AS total_quantity,
    SUM(r.cost) AS total_cost
FROM
    Schools s
JOIN
    Resources r ON s.school_id = r.school_id
GROUP BY
    s.school_id, s.name, r.resource_type
ORDER BY
    s.school_id, r.resource_type;

-- Region with the Highest Number of Teachers
SELECT r.region_name, COUNT(t.teacher_id) AS total_teachers
FROM Schools s
JOIN Teachers t ON s.school_id = t.school_id
JOIN Regions r ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_teachers DESC;

-- Region with the Highest Dropout Rates
SELECT r.region_name, COUNT(d.dropout_id) AS total_dropouts
FROM Dropouts d
JOIN Students st ON d.student_id = st.student_id
JOIN Schools s ON st.school_id = s.school_id
JOIN Regions r ON s.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_dropouts DESC;

-- Subjects taught in each region
SELECT 
    r.region_name,
    GROUP_CONCAT(DISTINCT t.subjects_taught) AS subjects
FROM 
    Teachers t
JOIN 
    Schools s ON t.school_id = s.school_id
JOIN 
    Regions r ON s.region_id = r.region_id
GROUP BY 
    r.region_name
ORDER BY 
    r.region_name;

-- DROPOUT REASON PER REGION
SELECT
    r.region_name AS region,
    d.dropout_reason AS reason_for_dropout,
    COUNT(d.dropout_id) AS total_dropouts
FROM
    Dropouts d
JOIN
    Students st ON d.student_id = st.student_id
JOIN
    Schools s ON st.school_id = s.school_id
JOIN
    Regions r ON s.region_id = r.region_id
GROUP BY
    r.region_name, d.dropout_reason
ORDER BY
    r.region_name, total_dropouts DESC;

-- REASON FOR DROPOUTS ACROSS GENDER 
SELECT
    r.region_name AS region,
    st.gender AS student_gender,
    d.dropout_reason AS reason_for_dropout,
    COUNT(d.dropout_id) AS total_dropouts
FROM
    Dropouts d
JOIN
    Students st ON d.student_id = st.student_id
JOIN
    Schools s ON st.school_id = s.school_id
JOIN
    Regions r ON s.region_id = r.region_id
GROUP BY
    r.region_name, st.gender, d.dropout_reason
ORDER BY
    r.region_name, st.gender, total_dropouts DESC;

-- Number of teachers and subjects taught per school
SELECT 
    s.name AS school_name,
    COUNT(t.teacher_id) AS total_teachers,
    GROUP_CONCAT(DISTINCT t.subjects_taught) AS subjects_taught
FROM 
    Teachers t
JOIN 
    Schools s ON t.school_id = s.school_id
GROUP BY 
    s.name
ORDER BY 
    total_teachers DESC, s.name
LIMIT 1000;


-- Creating a Consolidated Table with All Data
-- THIS TABLE WAS EDITED TO SHOW ACCURATE DATA
CREATE TABLE summary_data AS
SELECT
    s.region,
    AVG(st.performance) AS avg_performance,
    SUM(r.quantity) AS total_resources,
    COUNT(t.teacher_id) AS total_teachers,
    COUNT(d.dropout_id) AS total_dropouts
FROM schools s
JOIN students st ON s.school_id = st.school_id
JOIN resources r ON s.school_id = r.school_id
JOIN teachers t ON s.school_id = t.school_id
JOIN dropouts d ON s.school_id = d.school_id
GROUP BY s.region;