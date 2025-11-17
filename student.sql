use Covid19;

CREATE TABLE StudentDetail (
    StudentDetailID int PRIMARY KEY,
    StudentID int NOT NULL,
    AcademicYearID char(5) NOT NULL,
    RefNo char(12) NOT NULL,
    Title char(6) NOT NULL,
    Surname varchar(40) NULL,
    FirstForename varchar(50) NOT NULL,
    DateOfBirth date NOT NULL,
    Sex char(2) NOT NULL,
    Tel varchar(35) NULL,
    AltTel2 varchar(20) NULL,
    MobileTel varchar(35) NULL,
    Email varchar(250) NULL,
    EthnicGroupID char(2) NOT NULL
);

CREATE TABLE Enrolment (
    EnrolmentID int PRIMARY KEY,
    StudentDetailID int NOT NULL REFERENCES StudentDetail(StudentDetailID),
    StudentID int NOT NULL,
    OfferingID int NOT NULL,
    StartDate date NOT NULL,
    EndDate date NULL,
    ExpectedEndDate date NULL,
    ExpectedGLH int NOT NULL,
    CompletionStatusID int NOT NULL,
    CompletedOn date NULL,
    WithdrawnOn date NULL,
    FundingID int NULL
);


select * from StudentDetail;

select * from Enrolment;

/*Question 1*/
SELECT FirstForename
FROM StudentDetail
WHERE FirstForename LIKE 'N%';

/*Question 2*/
SELECT a.RefNo,
       a.Surname, 
	   a.FirstForename,
	   b.EnrolmentID, 
	   b.StartDate
FROM StudentDetail as a
INNER JOIN Enrolment as b ON a.StudentDetailID = b.StudentDetailID
WHERE b.StartDate >= '2024-08-01';

/*Question 3*/ 
SELECT 
    a.RefNo, 
    a.Surname, 
    a.FirstForename, 
    b.ExpectedEndDate,
    (CURRENT_DATE - b.ExpectedEndDate) AS DaysPastEndDate
FROM StudentDetail as a
INNER JOIN Enrolment as b ON a.StudentDetailID = b.StudentDetailID
WHERE b.CompletionStatusID = 1 /* Assuming 1 is 'Continuing*/
AND b.ExpectedEndDate < CURRENT_DATE
AND a.AcademicYearID = '23/24';
  
/*Question 4*/  
SELECT COUNT(*) AS WithdrawnLearners
FROM StudentDetail as a
INNER JOIN Enrolment as b  ON a.StudentDetailID = b.StudentDetailID
WHERE b.CompletionStatusID = 3 -- Assuming 3 is 'Withdrawn'
AND a.AcademicYearID = '23/24';

/*Question 5*/
SELECT b.FundingID, COUNT(*) AS NumberOfLearners
FROM Enrolment as b
GROUP BY b.FundingID;

/*Question 6*/
SELECT 
    a.RefNo, 
    a.Surname, 
    a.FirstForename, 
    b.OfferingID, 
    b.CompletionStatusID
FROM StudentDetail as a
INNER JOIN Enrolment as b ON a.StudentDetailID = b.StudentDetailID
WHERE b.FundingID = 25
AND b.ExpectedGLH > 400
ORDER BY b.CompletionStatusID ASC; /* Order by most relevant (1) to least (4)*/


SELECT 
    StudentDetailID,
    OfferingID,
    CompletionStatusID,
    ROW_NUMBER() OVER (PARTITION BY StudentDetailID ORDER BY CompletionStatusID ASC) AS rn
FROM Enrolment
WHERE FundingID = 25
  AND ExpectedGLH > 400
ORDER BY CompletionStatusID ASC;


/*Question 7*/
SELECT 
    a.RefNo, 
    a.Surname, 
    a.FirstForename, 
    b.OfferingID
FROM StudentDetail as a 
INNER JOIN Enrolment as b ON a.StudentDetailID = b.StudentDetailID
WHERE b.CompletionStatusID = 4 /*Assuming 4 is 'Transferred'*/
AND NOT EXISTS   (
    SELECT 1 
    FROM Enrolment as c 
    WHERE c.StudentDetailID = a.StudentDetailID 
    AND c.StartDate > b.CompletedOn
);