/*
===========================================================================
Create Database and Schemas
===========================================================================
script purpose :
  this scripts create a new Darabase named DataWareHouse after checking if it already exists.
  if the database exists , it is dropped and recreated . Additionally , the sets up the tehree withn the Database NAmed 'Bronze' ,'Silver', and 'gold'.

WARNING:
  Running theis scripts drop the entire 'DataWareHouse ' database if it exists . all data
  in databasewill be permanently deleted . procced with Caution and ensure you have proper 
  backups before running this scripts.

*/



use masters;
go

--drop and recreate  datawarehouse database
if exists(select 1 from sys.databases where name='DataWareHouse')
begin
  alter DATABASE DataWareHouse set Single_user with Rollback immediate;
  drop database DataWareHouse;
end;
go

--Create the 'DataWareHouse' Database
Create DATABASE DataWareHouse;
go

use DataWareHouse;
go

--Create SChemas 
Create Schema Bronze;
go

Create Schema Silver;
go

Create Schema Gold;
go
