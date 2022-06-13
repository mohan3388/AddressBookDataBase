--UC1 Create Database Addressbook --
create database AddressBook

use AddressBook 

create table Addressbook
(
Id int Primary Key Identity (1,1),
FirstName VarChar (200),
LastName varchar(150),
Address varchar(250),
City varchar(25),
State varchar(60),
ZipCode int,
PhoneNumber Varchar(10),
Email varchar(150)
);

--UC3 insert data in Address book--
Insert into AddressBook Values ('Rajesh','yadav','Bemetara','Durg','Chhattisgarh',490022,'7898625487','Mohan321@gmail.com'),
('Pukesh','yadav','Berla','Durg','Chhattisgarh',542154,'8952241265','rajd99@gmail.com'),
('murali','Upadhyay','gondiya','mumbai','Maharastra',675438,'8757889475','mural001@gmail.com'),
('komal','patil','saibaba nagar','surat','gujarat',34567,'7854216785','komal222@gmail.com'),
('riya','khairnar','shiv nagar','jaipur','Rajasthan',432007,'7285108928','riya8993@gmail.com');

select * from AddressBook

--UC4--
Update Addressbook Set City='Banglore',State='karnatak' where FirstName='Rajesh';
Update Addressbook Set Address='bhilai',ZipCode='491335' where FirstName='Pukesh';
select * from AddressBook

--UC5--
Delete from Addressbook where FirstName='riya';
select * from Addressbook

--UC6--
Select * from Addressbook where City='mumbai' Order By FirstName;
Select * from AddressBook where State='Maharastra' Order By FirstName;

--UC7--
select count(*) from AddressBook where city='Durg';

select count(*) from AddressBook where State='Maharastra';

--UC8--
select FirstName from Addressbook Order By City ASC;
select FirstName,LastName,City from Addressbook Order By City DESC;
select city from Addressbook order by LastName;

--UC9--
 alter table Addressbook ADD Type varchar (10);
 select * from Addressbook
  update AddressBook SET Type ='Family' Where FirstName = 'Pukesh';
update AddressBook SET Type = 'Profession' Where FirstName='murali';
update AddressBook SET Type = 'friends' Where FirstName='Rajesh';

 --UC10--
 select count(*),Type from Addressbook group by Type;

 --UC11--
 alter table Addressbook Drop column Type;

Select* from Addressbook;

Create table AddressBookType( TypeId int NOT NULL Primary Key  Identity(1,1),Type varchar(25), );


Create table AddressBookMapping( MappingID int primary key Identity (1,1),
AddressBookID int,
Typeid int,
);

alter table AddressBookMapping ADD Foreign key (AddressBookID) References AddressBook(Id);
alter table AddressBookMapping ADD Foreign key (Typeid) References AddressBookType(Typeid);

select * from AddressBookType;
select * from AddressBookMapping;

Insert into AddressBookType values('Friends'),('Family'),('Profession'),('others');

Insert into AddressBookMapping(AddressBookID,Typeid)values(1,1),(1,2);

select * from Addressbook INNER JOIN AddressBookMapping ON AddressBookID=AddressBookMapping.AddressBookID INNER JOIN AddressBookType ON AddressBookType.Typeid=AddressBookMapping.Typeid

--stored procedure--
Create procedure spGetAllPerson
As
Begin
try
Select *from AddressBook;
End TRY
BEGIN CATCH   
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 


-------------------------------
Create procedure spAddNewEmpPerson  
(   
   @FirstName varchar (50),  
   @LastName int,  
   @Address varchar (50),
   @City varchar(25),
   @State varchar(60),
   @ZipCode int,
   @PhoneNumber Varchar(10),
   @Type varchar(40),
   @Email varchar(150)

)  
as  
begin
try  
   Insert into AddressBook values(@FirstName,  
   @LastName,  
   @Address ,
   @City ,
   @State,
   @ZipCode ,
   @PhoneNumber,
   @Email )  
End TRY
BEGIN CATCH
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

----------------------------

Create Procedure [dbo].[spViewPerson]  
as  
begin
try  
   select *from AddressBook  
End TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH

spViewPerson


Create or alter procedure [dbo].[spUpdateEmpDetails]  
(  
   @Id int,  
   @Type varchar (50)  
)  
as  
begin
try  
   Update Addressbook   
   set Type = @type
   where Id=@Id  
End TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH

--spUpdateEmpDetails 5, 'ggdg'

 Create procedure [dbo].[spDeletePersonById]  
(  
   @Id int  
)  
as   
begin
try  
   Delete from Addressbook where Id=@Id  
End TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH

select * from Addressbook
spDeletePersonById 3
