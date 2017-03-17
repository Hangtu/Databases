#USE A DATABASE
USE <database_name>

#STRUCTURE TO GET DATA
 SELECT 
 FROM 
 WHERE
 GROUP BY
 HAVING  #Used with count,avg, sum, min
 ORDER BY

#CREATE A DATABASE
CREATE DATABASE <database_name>

#CREATE A NEW TABLE 
  CREATE TABLE  <table_name> (
  	 <table_name> <type_of_my_field> <constraints>,
  	 ....
  )

#GET RIDE DATA
	DELETE FROM <table_name> # DELETE AN ELEMENT OF MY TABLE
	TRUNCATE TABLE  <table_name> # DELETE ALL DATA INSIDE THE TABLE
	DROP TABLE  <table_name> #DROP THE TABLE

#INSERT DATA 
INSERT INTO <table_name> (<field1>,<field2>) VALUES (1,2),(3,4),(5,6);


#DECLARE VARIABLES
DECLARE @myVar AS int = 2;
SET @myVar = 4;
SELECT @myVar as value;

DECLARE @string1 as varchar(10) = 'Hello';
DECLARE @string2 as varchar(10) = 'World';
SELECT @string1+''+@string2 as myResult

#MATHEMATICAL FUNCTIONS
POWER(3,2)  #3^2;
SQUARE(3)   #3^3
FLOOR(12.2)  # 12 
CEILING(12.2) #13
ROUND(12.366,1) #12.40

#USING WHEN WITH NULL VALUES
DECLARE @string1 as varchar(10) = 'Hello0';
DECLARE @string2 as varchar(10) = 'World';
DECLARE @string1 as varchar(10);

SELECT @string1+''+@string2 as myResult,
CASE WHEN @string1 = 'Hello' THEN upper(@string1)
WHEN @string1 IS NULL THEN 'THIS VALUE IS NULL'
ELSE 'MY DEFAULT VALUE' END AS myResultUpper
--COALESCE('@string1','') ## Convert null value  to ''


##USING DATE FUNCTIONS
DECLARE @myDate as datetime = '2020-01-01 10:20:50';
SELECT year(@myDate),MONTH(@myDate), DAY(@myDate),
DATENAME(MONTH,@myDate) as myMonth;
GO
SELECT CURRENT_TIMESTAMP;
GO
SELECT GETDATE();

#GET INFORMATION ABOUT MY TABLE
sp_help <table_name>