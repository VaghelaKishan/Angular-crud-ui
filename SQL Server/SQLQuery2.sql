
<!---------Data Defination Language Commands(DDL)------->

CREATE DATABASE KishanDB;

USE KishanDB;

SELECT * FROM StudentsInfo;
SELECT * FROM InfoStudents;


CREATE TABLE StudentsInfo(
StudentId int,
StudentName varchar(8000),
ParentName varchar(8000),
PhoneNumber bigint,
AddressOfStudent varchar(8000), 
City varchar(8000),
Country varchar(8000),
);

DROP TABLE StudentsInfo,
DROP DATABASE KishanDB,

ALTER TABLE StudentsInfo ADD BloodGroup varchar(8000);
ALTER TABLE StudentsInfo DROP column BloodGroup;


<!---------add a column and datatype change also------->
ALTER TABLE StudentsInfo ADD DOB DATE;
ALTER TABLE StudentsInfo ALTER COLUMN DOB datetime;

INSERT INTO StudentsInfo VALUES ('31','kishan','vaghela','7600994846','mumbai','mumbai','india','o+','06Nov2001');
INSERT INTO StudentsInfo VALUES ('32','kevin','vaghela','7600994846','rajkot','rajkot','india','o-','06Nov2001');
INSERT INTO StudentsInfo VALUES ('33','raj','RAJ','7600994846','dehli','dehli','india','o-','06Nov2001');
INSERT INTO StudentsInfo VALUES ('34','nishit','kamani','7600994846','surat','surat','india','o-','06Nov2001');


TRUNCATE TABLE StudentsInfo;

<!---------RENAME A TABLE NAME------->
sp_rename 'StudentsInfo', 'Infostudents';
sp_rename 'Infostudents', 'StudentsInfo';


<!---------Constraints in Database------->
CREATE TABLE Infostudents(
StudentId int,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000) ,
PhoneNumber bigint,
AddressOfStudent varchar(8000 )NOT NULL, 
City varchar(8000),
Country varchar(8000),
);

INSERT INTO Infostudents VALUES ('31','KISHAN','vaghela','7600994846', NULL,'rajkot','india');

ALTER TABLE Infostudents ALTER COLUMN PhoneNumber int NOT NULL;

drop table infostudents;

<!---------Primary Key------->
CREATE TABLE Infostudents(
StudentId int UNIQUE NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000) ,
PhoneNumber bigint,
AddressOfStudent varchar(8000 )NOT NULL, 
City varchar(8000),
Country varchar(8000),
PRIMARY KEY(StudentID),
);

INSERT INTO Infostudents VALUES ('31','KISHAN','vaghela','7600994846', 'rajkott','rajkot','india');
INSERT INTO Infostudents VALUES ('31','KISHAN','vaghela','7600994846', 'rajkott','rajkot','india');     //<--error show-->

INSERT INTO Infostudents VALUES ('32','KISHAN','vaghela','7600994846', 'rajkott','rajkot','india');

drop table infostudents;

<!---------Constraint Key------->
CREATE TABLE Infostudents(
StudentId int NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000) ,
PhoneNumber bigint,
AddressOfStudent varchar(8000 )NOT NULL, 
City varchar(8000),
Country varchar(8000),
CONSTRAINT UC_Infostudents UNIQUE(StudentID ,PhoneNumber),
);

INSERT INTO Infostudents VALUES ('31','KISHAN','vaghela','7600994846', 'rajkott','rajkot','india');
INSERT INTO Infostudents VALUES ('31','KISHAN','vaghela','7600994846', 'rajkott','rajkot','india');     //<--error show-->

INSERT INTO Infostudents VALUES ('32','KISHAN','vaghela','987654321', 'rajkott','rajkot','india');

ALTER TABLE Infostudents ADD UNIQUE (StudentID);
drop table infostudents;

ALTER TABLE Infostudents
DROP CONSTRAINT UC_Infostudents;|


<!--------Check------->
CREATE TABLE Infostudents(
StudentId int NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000) ,
PhoneNumber bigint,
AddressOfStudent varchar(8000 )NOT NULL, 
City varchar(8000),
Country varchar(8000) check (Country ='india'),
);

INSERT INTO Infostudents VALUES ('32','KISHAN','vaghela','987654321', 'rajkott','rajkot','us');

ALTER TABLE StudentsInfo
ADD CHECK (Country='india');

ALTER TABLE StudentsInfo
ADD CONSTRAINT CHECKCONSTRAINTNAME CHECK (Country = 'india');

ALTER TABLE StudentsInfo
DROP CONSTRAINT CHECKCONSTRAINTNAME;

drop table infostudents;

<!--------Default ------->
CREATE TABLE Infostudents(
StudentId int NOT NULL,
StudentName varchar(8000) NOT NULL,
ParentName varchar(8000) ,
PhoneNumber bigint,
AddressOfStudent varchar(8000 )NOT NULL, 
City varchar(8000),
Country varchar(8000) default 'india',
);

INSERT INTO Infostudents VALUES ('32','KISHAN','vaghela','987654321', 'rajkott','rajkot','');
INSERT INTO Infostudents VALUES ('33','KISHAN','vaghela','987654321', 'rajkott','rajkot','');
INSERT INTO Infostudents VALUES ('34','KISHAN','vaghela','987654321', 'rajkott','rajkot','');



CREATE INDEX idex_StudentName
ON Infostudents (StudentName) ;


<!--------Insert /ADD/Delete/Update ------->
CREATE TABLE Infostudents(
StudentId int,
StudentName varchar(8000),
ParentName varchar(8000),
PhoneNumber bigint,
AddressOfStudent varchar(8000), 
City varchar(8000),
Country varchar(8000),
);

INSERT INTO Infostudents (StudentId,StudentName,ParentName,PhoneNumber,AddressOfStudent,City,Country) VALUES ('31','KISHAN','vaghela','7600994846', 'rajkott','rajkot','us');
INSERT INTO Infostudents VALUES ('32','kevin','vaghela','987654321', 'rajkot','rajkot','india');
INSERT INTO Infostudents VALUES ('33','nishit','kamani','123456789', 'rajkot','rajkot','india');
INSERT INTO Infostudents VALUES ('34','raj','boda','963852741', 'rajkot','rajkot','india');

SELECT * FROM Infostudents;

UPDATE Infostudents SET StudentName = 'Kirtan', City = 'Ahmedabad'
WHERE StudentID = 32;

DELETE FROM Infostudents WHERE StudentName='nishit';

<!--------MERGE ------->
CREATE TABLE SampleSourceTable (StudentID int, StudentName varchar(8000), Marks int);
CREATE TABLE SampleTargetTable (StudentID int, StudentName varchar(8000), Marks int) ;

 INSERT INTO SampleSourceTable VALUES ('1','KISHAN','99');
 INSERT INTO SampleSourceTable VALUES ('2','RAJ','87');
 INSERT INTO SampleSourceTable VALUES ('3','KIRTAN','80');

 INSERT INTO SampleTargetTable VALUES ('1','KISHAN','99');
 INSERT INTO SampleTargetTable VALUES ('2','RAJ','87');
 INSERT INTO SampleTargetTable VALUES ('3','SHABBIR','98');


MERGE SampleTargetTable TARGET USING SampleSourceTable SOURCE ON (TARGET.StudentID = SOURCE.StudentID)
WHEN MATCHED AND TARGET.StudentName <> Source.StudentName OR TARGET.Marks <> Source.Marks
THEN
UPDATE SET TARGET.StudentName = SOURCE.StudentName, TARGET.Marks = SOURCE.Marks
WHEN NOT MATCHED BY TARGET THEN
INSERT (StudentID, StudentName, Marks) VALUES (SOURCE.StudentID, SOURCE.StudentName, SOURCE.Marks)
WHEN NOT MATCHED BY SOURCE THEN
DELETE;

SELECT * FROM SampleSourceTable;
SELECT * FROM SampleTargetTable;

<!--------SELECT ------->
SELECT StudentId,StudentName FROM StudentsInfo;
SELECT * FROM StudentsInfo;

SELECT TOP 2 * FROM StudentsInfo;
SELECT DISTINCT City FROM StudentsInfo;   <--DISTINCT=  different value -->
SELECT * FROM StudentsInfo  ORDER BY StudentName DESC;  <-----DESC== decending Order  ACS=acesnding order  -->
SELECT * FROM StudentsInfo  ORDER BY StudentName ASC, ParentName DESC;

SELECT COUNT (StudentID), City FROM StudentsInfo GROUP BY City;

SELECT StudentID, StudentName, COUNT(City )FROM StudentsInfo GROUP BY
GROUPING SETS ((StudentID, StudentName, City), (StudentID), (StudentName), (City));

SELECT COUNT(StudentID), City FROM StudentsInfo GROUP BY City HAVING COUNT(StudentID) = 1
ORDER BY COUNT(StudentID) DESC;

SELECT * INTO StudentsBackup FROM StudentsInfo;

SELECT * INTO RajkotStudents FROM StudentsInfo WHERE City = 'rajkot';
SELECT * FROM RajkotStudents

		<!--------CUBE count------->
SELECT StudentID, Count(City) FROM StudentsInfo Group BY ROLLUP (StudentID);

	<!--------offset CLOSE ------->
CREATE TABLE OffsetMarks (Marks int);
INSERT INTO OffsetMarks VALUES ('65');
INSERT INTO OffsetMarks VALUES ('64');

INSERT INTO OffsetMarks VALUES ('62');
INSERT INTO OffsetMarks VALUES ('65');
INSERT INTO OffsetMarks VALUES ('61');

SELECT * FROM OffsetMarks ORDER BY Marks OFFSET 1 ROWS;
SELECT * FROM OffsetMarks ORDER BY Marks OFFSET 3 ROWS FETCH NEXT 2 ROWS ONLY;

<-----------   PIVOT         -------------->
CREATE TABLE SupplierTable(
SupplierID int NOT NULL,
DaysoftManufature int,
Cost int,
CustomerID int,
PurchaseId varchar (4000)
);

SELECT * FROM SupplierTable;

INSERT INTO SupplierTable VALUES ('1','12','1230','11','P1');
INSERT INTO SupplierTable VALUES ('2','21','1543','22','P2');
INSERT INTO SupplierTable VALUES ('3','32','2345','11','P3');
INSERT INTO SupplierTable VALUES ('4','14','8765','22','P1');
INSERT INTO SupplierTable VALUES ('5','42','3452','33','P3');
INSERT INTO SupplierTable VALUES ('6','31','5431','33','P1');
INSERT INTO SupplierTable VALUES ('7','41','2342','11','P2');
INSERT INTO SupplierTable VALUES ('8','54','3654','22','P2');
INSERT INTO SupplierTable VALUES ('9','33','1234','11','P3');
INSERT INTO SupplierTable VALUES ('10','36','6832','33','P2');
INSERT INTO SupplierTable VALUES ('1','12','1230','11','P1');

SELECT CustomerID, AVG (Cost) as AverageCostOfCustomer FROM SupplierTable GROUP BY CustomerID;
         <---//ONE ROW 3 COLOMN -->
SELECT 'AverageCostOfCustomer' AS Cost_According_To_Customers, [11], [22], [33]
FROM (
SELECT CustomerID, Cost FROM SupplierTable) AS SourceTable
PIVOT
(
AvG(Cost) FOR CustomerID IN ([11], [22], [33]))AS PivotTable; 


<-----------      UNPIVOT      -------------->
CREATE TABLE SampleTable (SupplierID int, AAA int, BBB int, CCC int)
GO
INSERT INTO SampleTable VALUES(1,3,5,6);
INSERT INTO SampleTable VALUES(2,9,2,8);
INSERT INTO SampleTable VALUES(3,8,1,7);
GO

select * from SampleTable;

SELECT SupplierID, Customers, Products
FROM (SELECT SupplierID, AAA,BBB,CCC FROM SampleTable) P
UNPIVOT 
(Products FOR Customers IN (AAA,BBB,CCC)) AS Example;
GO

<-----------     Joins    -------------->
CREATE TABLE Subjects (SubjectID Int, StudentID int, SubjectName varchar (8000) )

INSERT INTO Subjects VALUES ('10', '10', 'Maths');
INSERT INTO Subjects VALUES ('2', '11', 'Physics');
INSERT INTO Subjects VALUES ('3', '12', 'Chemistry');
INSERT INTO Subjects VALUES ('12', '10', 'Chemistry');


			<-----------   Inner  Joins    -------------->
SELECT Subjects.SubjectID, StudentsInfo.StudentName
FROM Subjects
INNER JOIN
StudentsInfo ON
Subjects.StudentID = StudentsInfo.StudentID

			<-----------   Left  Joins    -------------->
SELECT Subjects.SubjectID, StudentsInfo.StudentName
FROM StudentsInfo
LEFT JOIN
Subjects ON
StudentsInfo.StudentID = Subjects.StudentID
ORDER BY StudentsInfo.StudentName

			<-----------   RIGHT  Joins    -------------->
SELECT Subjects.SubjectID, StudentsInfo.StudentName
FROM StudentsInfo
RIGHT JOIN
Subjects ON
StudentsInfo.StudentID = Subjects.StudentID
ORDER BY StudentsInfo.StudentName

			<-----------  FULL OUTER Joins    -------------->
SELECT Subjects.SubjectID, StudentsInfo.StudentName
FROM StudentsInfo
FULL OUTER JOIN
Subjects ON
StudentsInfo.StudentID = Subjects.StudentID
ORDER BY StudentsInfo.StudentName


<-----------  STored Procedures    -------------->
CREATE PROCEDURE Students_City @SCity varchar( 8000)
AS
SELECT * FROM StudentsInfo
WHERE City = @SCity 
GO
SELECT * FROM StudentsInfo

EXEC Students_City @SCity = 'mumbai'

<----------- DCL COMMANDS    -------------->
CREATE LOGIN SAMPLE2 WITH PASSWORD = 'kishan'
CREATE USER	KISHAN FOR LOGIN SAMPLE2
GRANT SELECT ON StudentsInfo TO KISHAN
REVOKE SELECT ON StudentsInfo TO KISHAN

<----------- TCL COMMANDS    -------------->
CREATE TABLE TCLSample (StudentID int, StudentName varchar(8000), Marks int);
INSERT INTO TCLSample VALUES(1, 'Rohit', 23);
INSERT INTO TCLSample VALUES(2, 'Suhana', 48);
INSERT INTO TCLSample VALUES(3, 'Ashish', 65);
INSERT INTO TCLSample VALUES(4, 'Prerna', 32);

BEGIN TRY
BEGIN TRANSACTION
INSERT INTO TCLSample VALUES (5, 'Avinash', 56);
UPDATE TCLSample SET StudentName = 'Akash' WHERE StudentID ='5';
UPdATE TCLSample SET Marks = '67' WHERE StudentID = '5';
COMMIT TRANSACTION
PRINT 'Transaction Completed'
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Transaction Unsucessful and rolledback'
END CATCH

SELECT * FROM TCLSample;

 
