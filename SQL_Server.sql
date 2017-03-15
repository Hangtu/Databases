#USE A DATABASE
USE <database_name>

#STRUCTURE TO GET DATA
 SELECT 
 FROM 
 WHERE
 GROUP BY
 HAVING
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

#GET INFORMATION ABOUT MY TABLE
sp_help <table_name>