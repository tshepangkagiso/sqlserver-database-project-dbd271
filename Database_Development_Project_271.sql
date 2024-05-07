
--Database Creation
CREATE DATABASE SpatloPalace_Database
ON PRIMARY
(
	NAME= SpatloPalace,
	FILENAME='C:\Data\SpatloPalace_DatabasePri.mdf',
	SIZE=12MB,
	MAXSIZE=UNLIMITED,
	FILEGROWTH=12%
),
FILEGROUP Secodnary
(
	NAME= SpatloPalace_Database,
	FILENAME='C:\Data\SpatloPalace_DatabaseSec.ndf',
	SIZE=12MB,
	MAXSIZE=UNLIMITED,
	FILEGROWTH=12%
)
LOG ON
(
	NAME= SpatloPalace_Database1,
	FILENAME='C:\Data\SpatloPalace_DatabaseLog.ldf',
	SIZE=12MB,
	MAXSIZE=UNLIMITED,
	FILEGROWTH=12%	
);


/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/


--Table Creation
USE SpatloPalace_Database
GO
CREATE table Clients_Tables
(
	Client_ID INT PRIMARY KEY IDENTITY(1000,1), 
	Client_Name NCHAR(100) NOT NULL,
	Client_Contact_Person NCHAR(100) NOT NULL,
	Client_Phone_Number VARCHAR(120) NOT NULL UNIQUE,
	Client_Email NVARCHAR(180) NOT NULL UNIQUE,
	Client_Address NVARCHAR(180) NOT NULL UNIQUE,
	

);
CREATE table Suppliers_Tables
(
	Supplier_ID INT PRIMARY KEY IDENTITY(1000,1),
	Supplier_Name NCHAR(100) NOT NULL,
	Suppliers_Contact_Person NCHAR(100) NOT NULL,
    Suppliers_Phone_Number VARCHAR(120) NOT NULL UNIQUE,
	Suppliers_Email NVARCHAR(180) NOT NULL UNIQUE,
	Suppliers_Address NVARCHAR(180) NOT NULL UNIQUE
	
);
CREATE table Employees_Tables
(
	Employee_ID INT PRIMARY KEY IDENTITY(1000,1),
	Employee_Name NCHAR(100) NOT NULL,
	Employee_Position NVARCHAR(100) NOT NULL,
	Employee_Phone_Number VARCHAR(120) NOT NULL UNIQUE,
	Employee_Email NVARCHAR(180) NOT NULL UNIQUE,
	Employee_Address NVARCHAR(180) NOT NULL UNIQUE
);
CREATE table Projects_Tables
(
	Project_ID INT PRIMARY KEY IDENTITY(1000,1),
	Client_ID INT CONSTRAINT FK_Projects_Clients FOREIGN KEY(Client_ID) REFERENCES Clients_Tables(Client_ID),
	Project_Description NVARCHAR(100) NOT NULL,
	Project_Start_Date DATE NOT NULL,
	Project_End_Date DATE NOT NULL,
	Project_Status NVARCHAR(100) CHECK(Project_Status IN ('progress', 'completed', 'cancelled')),
	Project_Total_Cost MONEY NOT NULL,
	Employee_ID INT CONSTRAINT FK_Projects_Employees FOREIGN KEY(Employee_ID) REFERENCES Employees_Tables(Employee_ID),
	Supplier_ID INT CONSTRAINT FK_Projects_Suppliers FOREIGN KEY(Supplier_ID) REFERENCES Suppliers_Tables(Supplier_ID)
);
CREATE table  Financial_Transactions_Tables
(
	Transaction_ID INT PRIMARY KEY IDENTITY(1000,1),
	Financial_Transactions_Date DATE NOT NULL,
	Financial_Transactions_Type NVARCHAR(100) CHECK(Financial_Transactions_Type IN ( 'invoice', 'payment', 'expense')),
	Financial_Transactions_Amount MONEY NOT NULL,
	Financial_Transactions_Description NVARCHAR(50) NOT NULL,
	Client_ID INT CONSTRAINT FK_Finances_Clients FOREIGN KEY(Client_ID) REFERENCES Clients_Tables(Client_ID),
	Employee_ID INT CONSTRAINT FK_Finances_Employees FOREIGN KEY(Employee_ID) REFERENCES Employees_Tables(Employee_ID),
	Supplier_ID INT CONSTRAINT FK_Finanaces_Suppliers FOREIGN KEY(Supplier_ID) REFERENCES Suppliers_Tables(Supplier_ID)

);

GO

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/


-- Data Insertion
	-- Clients_Tables
	use SpatloPalace_Database
	INSERT INTO Clients_Tables (Client_Name, Client_Contact_Person, Client_Phone_Number, Client_Email, Client_Address)
	VALUES 
			('ABC Corporation', 'John Smith', '555-1234', 'john@abccorp.com', '123 Main Street'),
			('XYZ Inc.', 'Jane Doe', '555-5678', 'jane@xyzinc.com', '456 Elm Street'),
			('Acme Company', 'Bob Johnson', '555-9876', 'bob@acmeco.com', '789 Oak Street'),
			('Global Enterprises', 'Sarah Lee', '555-4321', 'sarah@globale.com', '456 Pine Street'),
			('Big Corporation', 'Tom Brown', '555-5555', 'tom@bigcorp.com', '111 Walnut Street'),
			('New Horizons', 'Lisa Smith', '555-1111', 'lisa@newhorizons.com', '222 Cherry Street'),
			('Superb Solutions', 'Mike Johnson', '555-2222', 'mike@superbsol.com', '333 Maple Street'),
			('Golden Opportunities', 'Karen Lee', '555-3333', 'karen@goldenopp.com', '444 Birch Street'),
			('Futuretech', 'Joe Brown', '555-4444', 'joe@futuretech.com', '555 Cedar Street'),
			('Dynamic Innovations', 'Rachel Lee', '555-6789', 'rachel@dynamicinn.com', '666 Pine Street');

	-- Suppliers_Tables
	use SpatloPalace_Database
	INSERT INTO Suppliers_Tables (Supplier_Name, Suppliers_Contact_Person, Suppliers_Phone_Number, Suppliers_Email, Suppliers_Address)
	VALUES 
			('ABC Supplier Co.', 'John Smith', '555-1234', 'john@abcsupco.com', '123 Main Street'),
			('XYZ Supplier Inc.', 'Jane Doe', '555-5678', 'jane@xyzsupinc.com', '456 Elm Street'),
			('Acme Supplier Co.', 'Bob Johnson', '555-9876', 'bob@acmesupco.com', '789 Oak Street'),
			('Global Supplier Enterprises', 'Sarah Lee', '555-4321', 'sarah@globalsuppliere.com', '456 Pine Street'),
			('Big Supplier Corp.', 'Tom Brown', '555-5555', 'tom@bigsuppliercorp.com', '111 Walnut Street'),
			('New Supplier Horizons', 'Lisa Smith', '555-1111', 'lisa@newsupplierhoriz.com', '222 Cherry Street'),
			('Superb Supplier Solutions', 'Mike Johnson', '555-2222', 'mike@superbsuppliersol.com', '333 Maple Street'),
			('Golden Supplier Opportunities', 'Karen Lee', '555-3333', 'karen@goldensupplieropp.com', '444 Birch Street'),
			('Future Supplier Tech', 'Joe Brown', '555-4444', 'joe@futuresupptech.com', '555 Cedar Street'),
			('Dynamic Supplier Innovations', 'Rachel Lee', '555-6789', 'rachel@dynamicsuppinno.com', '666 Pine Street');


	-- Employees_Tables
	INSERT INTO Employees_Tables (Employee_Name, Employee_Position, Employee_Phone_Number, Employee_Email, Employee_Address)
	VALUES 
			('John Smith', 'Sales Manager', '555-1234', 'john.smith@example.com', '123 Main St'),
			('Jane Doe', 'Marketing Specialist', '555-5678', 'jane.doe@example.com', '456 Oak Ave'),
			('Mark Johnson', 'IT Manager', '555-9012', 'mark.johnson@example.com', '789 Elm St'),
			('Emily Davis', 'Human Resources Coordinator', '555-3456', 'emily.davis@example.com', '234 Maple Ave'),
			('David Lee', 'Software Engineer', '555-7890', 'david.lee@example.com', '567 Pine St'),
			('Susan Brown', 'Financial Analyst', '555-2345', 'susan.brown@example.com', '890 Birch St'),
			('Chris Taylor', 'Project Manager', '555-6789', 'chris.taylor@example.com', '901 Cedar St'),
			('Sarah Nguyen', 'Graphic Designer', '555-4321', 'sarah.nguyen@example.com', '345 Spruce St'),
			('Tom Wilson', 'Customer Service Representative', '555-8765', 'tom.wilson@example.com', '678 Fir St'),
			('Lisa Patel', 'Administrative Assistant', '555-2109', 'lisa.patel@example.com', '012 Pine St')


	-- Projects_Tables
	INSERT INTO Projects_Tables (Client_ID, Project_Description, Project_Start_Date, Project_End_Date, Project_Status, Project_Total_Cost, Employee_ID,Supplier_ID)
	VALUES 
			(1000, 'Website Redesign', '2022-01-01', '2022-02-28', 'completed', 5000.00, 1000,1000),
			(1001, 'Product Launch', '2022-03-01', '2022-04-30', 'progress', 10000.00, 1001,1001),
			(1002, 'Marketing Campaign', '2022-05-01', '2022-06-30', 'progress', 7500.00, 1002,1002),
			(1003, 'Software Development', '2022-07-01', '2022-08-31', 'cancelled', 8000.00, 1003,1003),
			(1004, 'Social Media Management', '2022-09-01', '2022-10-31', 'progress', 6000.00, 1004,1004),
			(1005, 'Event Planning', '2022-11-01', '2022-12-31', 'progress', 9000.00, 1005,1005),
			(1006, 'Market Research', '2023-01-01', '2023-02-28', 'progress', 4000.00, 1006,1006),
			(1007, 'Training Program', '2023-03-01', '2023-04-30', 'progress', 3000.00, 1007,1007),
			(1008, 'SEO Optimization', '2023-05-01', '2023-06-30', 'progress', 6500.00, 1008,1008),
			(1009, 'Sales Strategy', '2023-07-01', '2023-08-31', 'progress', 8500.00, 1009,1009)


	-- Financial_Transactions_Table
	INSERT INTO Financial_Transactions_Tables 
		(Financial_Transactions_Date, Financial_Transactions_Type, Financial_Transactions_Amount, Financial_Transactions_Description, Client_ID, Employee_ID,Supplier_ID)
	VALUES
			('2022-01-01', 'invoice', 5000.00, 'Payment for project A', 1000, 1001,1000),
			('2022-01-05', 'payment', -2000.00, 'Payment for materials', 1002, 1002,1001),
			('2022-01-10', 'invoice', 8000.00, 'Payment for project B', 1003, 1003,1002),
			('2022-01-15', 'expense', -500.00, 'Office supplies', 1004, 1001,1003),
			('2022-01-20', 'payment', -1000.00, 'Payment for rent', 1005, 1004,1004),
			('2022-01-25', 'invoice', 6000.00, 'Payment for project C', 1006, 1005,1005),
			('2022-02-01', 'payment', -1500.00, 'Payment for utilities', 1007, 1006,1006),
			('2022-02-05', 'invoice', 4000.00, 'Payment for project D', 1008, 1007,1007),
			('2022-02-10', 'expense', -200.00, 'Travel expenses', 1009, 1008,1008),
			('2022-02-15', 'payment', -3000.00, 'Payment for equipment', 1001, 1009,1009);

GO

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/



--Views for each table
	-- Clients_Tables
	USE SpatloPalace_Database

	GO
	CREATE VIEW vw_Clients_Tables
	AS
		SELECT * FROM Clients_Tables

	-- Suppliers_Tables
	GO
	CREATE VIEW  vw_Suppliers_Tables
	AS
		SELECT * FROM Suppliers_Tables

	-- Employees_Tables
	GO
	CREATE VIEW  vw_Employees_Tables
	AS
		SELECT * FROM Employees_Tables

	-- Projects_Tables
	GO
	CREATE VIEW vw_Projects_Tables
	AS
		SELECT * FROM Projects_Tables

	-- Financial_Transactions_Table
	GO
	CREATE VIEW vw_Financial_Transactions_Tables
	AS
		SELECT * FROM Financial_Transactions_Tables



GO

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/


-- INSERT STORED PROCEDURE WITH A TRY CATCH FOR EACH TABLE THROUGH ITS VIEW

	-- Clients_Tables INSERT PROCEDURE
	USE SpatloPalace_Database
	GO
	CREATE PROCEDURE vw_Clients_Tables_Insert_Procedure
	@Client_Name NCHAR(100),
	@Client_Contact_Person NCHAR(100),
	@Client_Phone_Number VARCHAR(120),
	@Client_Email NVARCHAR(180),
	@Client_Address NVARCHAR(180)
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
							INSERT INTO vw_Clients_Tables (Client_Name, Client_Contact_Person, Client_Phone_Number, Client_Email, Client_Address)
							VALUES(@Client_Name,@Client_Contact_Person,@Client_Phone_Number,@Client_Email,@Client_Address)
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL INSERTION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


	 -- Suppliers_Tables INSERT PROCEDURE
	 GO
	 CREATE PROCEDURE vw_Suppliers_Tables_INSERT_PROCEDURE
		@Supplier_Name NCHAR(100),
		@Suppliers_Contact_Person NCHAR(100),
		@Suppliers_Phone_Number VARCHAR(120),
		@Suppliers_Email NVARCHAR(180),
		@Suppliers_Address NVARCHAR(180)
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						INSERT INTO vw_Suppliers_Tables (Supplier_Name, Suppliers_Contact_Person, Suppliers_Phone_Number, Suppliers_Email, Suppliers_Address)
						VALUES (@Supplier_Name, @Suppliers_Contact_Person, @Suppliers_Phone_Number, @Suppliers_Email, @Suppliers_Address)
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL INSERTION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END



	-- Employees_Tables INSERT PROCEDURE
	 GO
	 CREATE PROCEDURE vw_Employees_Tables_INSERT_PROCEDURE
		@Employee_Name NCHAR(100),
		@Employee_Position NVARCHAR(100),
		@Employee_Phone_Number VARCHAR(120),
		@Employee_Email NVARCHAR(180),
		@Employee_Address NVARCHAR(180)
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
								INSERT INTO vw_Employees_Tables (Employee_Name, Employee_Position, Employee_Phone_Number, Employee_Email, Employee_Address)
			                    VALUES (@Employee_Name, @Employee_Position, @Employee_Phone_Number, @Employee_Email, @Employee_Address)
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL INSERTION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


	 -- Projects_Tables INSERT PROCEDURE
	 GO
	 CREATE PROCEDURE vw_Projects_Tables_INSERT_PROCEDURE
		@Client_ID INT,
		@Project_Description NVARCHAR(100),
		@Project_Start_Date DATE,
		@Project_End_Date DATE,
		@Project_Status NVARCHAR(100),
		@Project_Total_Cost MONEY,
		@Employee_ID INT,
		@Supplier_ID INT
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						INSERT INTO vw_Projects_Tables (Client_ID, Project_Description, Project_Start_Date, Project_End_Date, Project_Status, Project_Total_Cost, Employee_ID,Supplier_ID)
						VALUES(@Client_ID, @Project_Description, @Project_Start_Date, @Project_End_Date, @Project_Status, @Project_Total_Cost, @Employee_ID,@Supplier_ID)
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL INSERTION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


     -- Financial_Transactions_Table INSERT PROCEDURE
	 GO
	 CREATE PROCEDURE vw_Financial_Transactions_Tables_INSERT_PROCEDURE
		@Financial_Transactions_Date DATE,
		@Financial_Transactions_Type NVARCHAR(100),
		@Financial_Transactions_Amount MONEY,
		@Financial_Transactions_Description NVARCHAR(50),
		@Client_ID INT,
		@Employee_ID INT,
		@Supplier_ID INT
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
							INSERT INTO vw_Financial_Transactions_Tables(Financial_Transactions_Date, Financial_Transactions_Type, Financial_Transactions_Amount, Financial_Transactions_Description, Client_ID, Employee_ID, Supplier_ID)
							VALUES(@Financial_Transactions_Date, @Financial_Transactions_Type, @Financial_Transactions_Amount, @Financial_Transactions_Description, @Client_ID, @Employee_ID,@Supplier_ID)
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL INSERTION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


GO

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/


--UPDATE QUERY STORED PROCEDURES FOR EACH TABLE THROUGH ITS VIEW
	-- Clients_Tables UPDATE PROCEDURE
    USE SpatloPalace_Database
	GO
	CREATE PROCEDURE vw_Clients_Tables_Update_Procedure	
	@ClientID INT,
    @ClientName NCHAR(100),
    @ClientContactPerson NCHAR(100),
    @ClientPhoneNumber VARCHAR(120),
    @ClientEmail NVARCHAR(180),
    @ClientAddress NVARCHAR(180)
	AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					    UPDATE vw_Clients_Tables
						SET
							Client_Name = @ClientName,
							Client_Contact_Person = @ClientContactPerson,
							Client_Phone_Number = @ClientPhoneNumber,
							Client_Email = @ClientEmail,
							Client_Address = @ClientAddress
						WHERE
							Client_ID = @ClientID
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL UPDATING OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END	

	
	-- Suppliers_Tables UPDATE PROCEDURE
	GO
	CREATE PROCEDURE vw_Suppliers_Tables_Update_PROCEDURE
	    @Supplier_ID INT,
		@Supplier_Name NCHAR(100),
		@Suppliers_Contact_Person NCHAR(100),
		@Suppliers_Phone_Number VARCHAR(120),
		@Suppliers_Email NVARCHAR(180),
		@Suppliers_Address NVARCHAR(180)
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						UPDATE vw_Suppliers_Tables
						SET
							Supplier_Name = @Supplier_Name,
							Suppliers_Contact_Person = @Suppliers_Contact_Person,
						    Suppliers_Phone_Number = @Suppliers_Phone_Number,
							Suppliers_Email = @Suppliers_Email,
							Suppliers_Address = @Suppliers_Address
						WHERE 
							Supplier_ID = @Supplier_ID 
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL UPDATING OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


	-- Employees_Tables UPDATE PROCEDURE
	GO
	CREATE PROCEDURE vw_Employees_Tables_Update_PROCEDURE
	    @Employee_ID INT,
		@Employee_Name NCHAR(100),
		@Employee_Position NVARCHAR(100),
		@Employee_Phone_Number VARCHAR(120),
		@Employee_Email NVARCHAR(180),
		@Employee_Address NVARCHAR(180)
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					    UPDATE vw_Employees_Tables
						SET
							Employee_Name = @Employee_Name,
							Employee_Position = @Employee_Position,
							Employee_Phone_Number = @Employee_Phone_Number,
							Employee_Email = @Employee_Email,
							Employee_Address = @Employee_Address
						WHERE
							Employee_ID = @Employee_ID;
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL UPDATING OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


	-- Projects_Tables UPDATE PROCEDURE
	GO
	CREATE PROCEDURE vw_Projects_Tables_Update_PROCEDURE
		@Project_ID INT,
		@Client_ID INT,
		@Project_Description NVARCHAR(100),
		@Project_Start_Date DATE,
		@Project_End_Date DATE,
		@Project_Status NVARCHAR(100),
		@Project_Total_Cost MONEY,
		@Employee_ID INT,
		@Supplier_ID INT
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					    UPDATE vw_Projects_Tables
						SET
							Client_ID = @Client_ID,
							Project_Description = @Project_Description,
							Project_Start_Date = @Project_Start_Date,
							Project_End_Date = @Project_End_Date,
							Project_Status = @Project_Status,
							Project_Total_Cost = @Project_Total_Cost,
							Employee_ID = @Employee_ID,
							Supplier_ID = @Supplier_ID 
						WHERE
							Project_ID = @Project_ID;
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL UPDATING OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


	-- Financial_Transactions_Table UPDATE PROCEDURE
	GO
	CREATE PROCEDURE vw_Financial_Transactions_Tables_Update_PROCEDURE
		@TransactionID INT,
		@TransactionDate DATE,
		@TransactionType NVARCHAR(100),
		@TransactionAmount MONEY,
		@TransactionDescription NVARCHAR(50),
		@ClientID INT,
		@EmployeeID INT,
		@Supplier_ID INT
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
					    UPDATE vw_Financial_Transactions_Tables
						SET Financial_Transactions_Date = @TransactionDate,
							Financial_Transactions_Type = @TransactionType,
							Financial_Transactions_Amount = @TransactionAmount,
							Financial_Transactions_Description = @TransactionDescription,
							Client_ID = @ClientID,
							Employee_ID = @EmployeeID,
							Supplier_ID = @Supplier_ID 
						WHERE 
							Transaction_ID = @TransactionID
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL UPDATING OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END

GO

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/


-- DELETE STORED PROCEDURE FOR EACH TABLE VIEW
	-- Clients_Tables UPDATE PROCEDURE
USE SpatloPalace_Database
GO
	CREATE PROCEDURE vw_Clients_Tables_Delete_PROCEDURE
		@clientID int
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						DELETE FROM vw_Clients_Tables
						WHERE Client_ID = @clientID
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL DELETION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END

	GO
	-- Suppliers_Tables DELETE PROCEDURE
	CREATE PROCEDURE vw_Suppliers_Tables_Delete_PROCEDURE
		@supplierID int
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						DELETE FROM vw_Suppliers_Tables
						WHERE Supplier_ID = @supplierID
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL DELETION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END
	GO

	
	-- Employees_Tables DELETE PROCEDURE
	CREATE PROCEDURE vw_Employees_Tables_Delete_PROCEDURE
		@employeeID int
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						DELETE FROM vw_Employees_Tables
						WHERE Employee_ID = @employeeID
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL DELETION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END


	GO
    -- Projects_Tables DELETE PROCEDURE
	CREATE PROCEDURE vw_Projects_Tables_Delete_PROCEDURE
		@projectID int
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						DELETE FROM vw_Projects_Tables
						WHERE Project_ID = @projectID
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL DELETION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END
	GO

	-- Financial_Transactions_Table DELETE PROCEDURE
	CREATE PROCEDURE vw_Financial_Transactions_Table_Delete_PROCEDURE
		@transactionID int
	 AS
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION
						DELETE FROM vw_Financial_Transactions_Tables
						WHERE Transaction_ID = @transactionID
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				PRINT'UNSUCCESSFUL DELETION OF DATA, CHECK YOUR PARAMETERS MEET REQUIREMENTS'
			END CATCH
		END

GO

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

--TRIGGERS FOR ALL TABLES

	--TRIGGER FOR Clients_Tables
    USE SpatloPalace_Database
	GO
	CREATE TRIGGER tr_Clients_Tables
	ON Clients_Tables
	AFTER INSERT,UPDATE,DELETE
	AS
		BEGIN
			BEGIN
				PRINT'Completed'
			END
			
		END

	--TRIGGER FOR Suppliers_Tables
	GO
	CREATE TRIGGER tr_Suppliers_Tables
	ON Suppliers_Tables
	AFTER INSERT,UPDATE,DELETE
	AS
		BEGIN
			BEGIN
				PRINT'Completed'
			END
			
		END

	--TRIGGER FOR Employees_Tables
	GO
	CREATE TRIGGER tr_Employees_Tables
	ON Employees_Tables
	AFTER INSERT,UPDATE,DELETE
	AS
		BEGIN
			BEGIN
				PRINT'Completed'
			END
			
		END

	--TRIGGER FOR Projects_Tables
	GO
	CREATE TRIGGER tr_Projects_Tables
	ON Projects_Tables
	AFTER INSERT,UPDATE,DELETE
	AS
		BEGIN
			BEGIN
				PRINT'Completed'
			END
			
		END

	--TRIGGER FOR Financial_Transactions_Table
	GO
	CREATE TRIGGER tr_Financial_Transactions_Tables
	ON Financial_Transactions_Tables
	AFTER INSERT,UPDATE,DELETE
	AS
		BEGIN
			BEGIN
				PRINT'Completed'
			END
			
		END


/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

--index for the Clients_Tables
GO
USE SpatloPalace_Database
GO
CREATE NONCLUSTERED INDEX Clients_Table_Name_Phone_Email_ 
ON Clients_Tables(Client_Name, Client_Phone_Number, Client_Email);

--Index for the Suppliers_Tables

CREATE NONCLUSTERED INDEX Suppliers
ON Suppliers_Tables(Supplier_Name, Suppliers_Phone_Number, Suppliers_Address, Suppliers_Email);

--index for the Financial_Transactions_Table

CREATE INDEX Financial_Transactions_Transaction_Date_Type 
ON Financial_Transactions_Tables(Transaction_ID, Financial_Transactions_Date,   Financial_Transactions_Type)

--index for the Projects_Tables

CREATE INDEX Projects 
ON Projects_Tables(Project_ID, Project_Description, Project_Status, Employee_ID);

--index for the Employees_Tables

CREATE INDEX Employees 
ON Employees_Tables(Employee_ID, Employee_Name, Employee_Position, Employee_Phone_Number);

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

--Common Table Express with Subquery 
GO
USE SpatloPalace_Database
GO
WITH Projects_CTE AS (
    SELECT p.Project_ID, p.Project_Description, p.Project_Total_Cost, c.Client_Name
    FROM Projects_Tables p
    JOIN Clients_Tables c 
	ON p.Client_ID = c.Client_ID
    WHERE p.Project_Status = 'completed'
)
SELECT *
FROM Projects_CTE;

-- 2nd CTE - calsulates the clients total project costs and enables us to see the ones that cost more than R1000

WITH ProjectCosts_CTE AS (
    SELECT CT.Client_Name, SUM(PT.Project_Total_Cost) AS Total_Cost
    FROM Clients_Tables CT
    INNER JOIN Projects_Tables PT 
	ON CT.Client_ID = PT.Client_ID
    WHERE PT.Project_Status = 'completed'
    GROUP BY CT.Client_Name
)
SELECT *
FROM ProjectCosts_CTE
WHERE Total_Cost > 1000;

--3rd CTE - calculates the total cost of all the projects for each client. 

WITH Total_Project_Cost AS (
    SELECT CT.Client_ID, CT.Client_Name, SUM(PT.Project_Total_Cost) AS 'Total_Project_Cost'
    FROM Clients_Tables CT
    INNER JOIN Projects_Tables PT
	ON CT.Client_ID = PT.Client_ID
    GROUP BY CT.Client_ID, CT.Client_Name
)
SELECT *
FROM Total_Project_Cost

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
--functions   /*DISCOUNT FUNCTION, Sale function, profit/loss function*/
GO
CREATE FUNCTION Discount (@TheProductPrice MONEY, @TheDiscountPct FLOAT)
RETURNS MONEY
AS
BEGIN
	DECLARE @DiscPrice MONEY;
	SET @DiscPrice = @TheProductPrice * (12 - (@TheDiscountPct / 100));
	RETURN @DiscPrice;
END;

--below is a "sale function" for when the business wants to draw in customers

GO
CREATE FUNCTION Sale (@TheProdPrice MONEY, @SalePct FLOAT)
RETURNS MONEY
AS
BEGIN
	DECLARE @TheSalePrice MONEY;
	SET @TheSalePrice = @TheProdPrice * (1 - (@SalePct / 100));
	RETURN @TheSalePrice;
END;

-- this function will calculate any additional costs that may arise if the Project_Total_Cost increases

GO 
CREATE FUNCTION calculate_costs
	(@percentage INT =10) 
	RETURNS DECIMAL(14,2) 
BEGIN 
		DECLARE @extra_costs DEC (12,2), 
				@sum_of_budget dec(14,2) 
		SELECT @sum_of_budget = SUM (Project_Total_Cost) FROM Projects_Tables 
		SET @extra_costs = @sum_of_budget * @percentage/100 
		RETURN @extra_costs 
END
GO
/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
--system securtiy
--Login and Users
	GO
	USE SpatloPalace_Database
	GO

	--Executives have unlimited access
	CREATE LOGIN Executives_Login
	WITH PASSWORD ='Executive'
	GO
	CREATE USER Executive_User
	FOR LOGIN Executives_Login
	GO

	--Developers have excess to everything expection Deletion
	CREATE LOGIN Developer_Login
	WITH PASSWORD ='Developer'
	GO
	CREATE USER Developer_User
	FOR LOGIN Developer_Login
	GO

	--General employees have a limited access to database for only selection and Insertion 
	CREATE LOGIN General_Login
	WITH PASSWORD ='General'
	GO
	CREATE USER General_User
	FOR LOGIN General_Login

-- Database Roles
	CREATE ROLE Executive AUTHORIZATION dbo
	GO
	ALTER ROLE Executive
	ADD Member Executive_User
	GO

	CREATE ROLE Developer AUTHORIZATION dbo
	GO
	ALTER ROLE Developer
	ADD Member Developer_User
	GO

	CREATE ROLE General AUTHORIZATION dbo
	GO
	ALTER ROLE General
	ADD Member General_User

--Permissions given to each role

	--Executive Permissions
	GRANT SELECT,INSERT,UPDATE,DELETE
	ON vw_Clients_Tables
	TO Executive

	GRANT SELECT,INSERT,UPDATE,DELETE
	ON vw_Employees_Tables
	TO Executive

	GRANT SELECT,INSERT,UPDATE,DELETE
	ON vw_Financial_Transactions_Tables
	TO Executive

	GRANT SELECT,INSERT,UPDATE,DELETE
	ON vw_Suppliers_Tables
	TO Executive

	GRANT SELECT,INSERT,UPDATE,DELETE
	ON vw_Projects_Tables
	TO Executive

	--Developer Permissions
	GRANT SELECT,INSERT,UPDATE
	ON vw_Clients_Tables
	TO Developer
	GO
	GRANT SELECT,INSERT,UPDATE
	ON vw_Employees_Tables
	TO Developer
	GO
	GRANT SELECT,INSERT,UPDATE
	ON vw_Financial_Transactions_Tables
	TO Developer
	GO
	GRANT SELECT,INSERT,UPDATE
	ON vw_Suppliers_Tables
	TO Developer
	GO
	GRANT SELECT,INSERT,UPDATE
	ON vw_Projects_Tables
	TO Developer
	GO


	--General Permissions
	GRANT SELECT,INSERT
	ON vw_Clients_Tables
	TO Manager
	GO
	GRANT SELECT,INSERT
	ON vw_Employees_Tables
	TO Manager
	GO
	GRANT SELECT,INSERT
	ON vw_Financial_Transactions_Tables
	TO Manager
	GO
	GRANT SELECT,INSERT
	ON vw_Suppliers_Tables
	TO Manager
	GO
	GRANT SELECT,INSERT
	ON vw_Projects_Tables
	TO Manager

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

--back up & recovery
BACKUP DATABASE SpatloPalace_Database
TO DISK = 'C:\backup\backup_file.bak'
WITH INIT

RESTORE DATABASE SpatloPalace_Database
FROM DISK
WITH REPLACE

/* ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
USE SpatloPalace_Database
GO
--data replication

--configure the distributor
EXEC sp_adddistributor @distributor = N'Performance Food Group',@password=N'password'

--create a publication
EXEC sp_addpublication @publication = N'Bon Appétit',@status=N'active',@allow_push = N'true', @allow_pull = N'true'

--configure articles
EXEC sp_addarticle @publication = N'Bon Appétit', @article = N'MyTable', @source_owner = N'dbo', @source_object = N'MyTable', @destination_table = N'MyTable', @type = N'logbased', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @status = 24

--Create a subscription
EXEC sp_addsubscription @publication = N'Bon Appétit', @subscriber = N'John Smith', @destination_db = N'John SmithDatabase', @subscription_type = N'Push'

--configure subscription
EXEC sp_changepublication @publication = N'Bon Appétit', @property = N'allow_anonymous', @value = N'false'
EXEC sp_changepublication @publication = N'Bon Appétit', @property = N'immediate_sync', @value = N'false'
EXEC sp_changepublication @publication = N'Bon Appétit', @property = N'retain_published', @value = N'false'
EXEC sp_changepublication @publication = N'Bon Appétit', @property = N'replicate_ddl', @value = 0

--initialize the subscription
EXEC sp_addsubscription @publication = N'Bon Appétit', @subscriber = N'John Smith', @destination_db = N'John SmithDatabase', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
EXEC sp_startpublication_snapshot @publication = N'Bon Appétit'


--concurrency control

--LOCKING for Employees table
-- This transcation select a row from the employees table with an exclusive lock using TABLOCKX

	BEGIN TRANSACTION
	SELECT *FROM vw_Employees_Tables with (TABLOCKX)
	WHERE Employee_Email='john.smith@example.com'
	UPDATE vw_Employees_Tables SET Employee_Phone_Number = '555-1234'
	WHERE Employee_Email = 'john.smith@example.com'
	IF @@ERROR <> 0
	BEGIN
	ROLLBACK 
	END
	ELSE
	BEGIN
	COMMIT 
	END

--The lock hint(UPDLOCK,ROWLOCK) are used in the select statement to lock rows being selected.
--UPDLOCK locks rows to ensure no other transactions modify them before updating them.
--ROWLOCK helps reduce contention and improve concurrency.

	BEGIN TRANSACTION
	DECLARE @clientid INT, @name VARCHAR(50), @email VARCHAR(50), @phonenumber VARCHAR(20), @address VARCHAR(100)

	SET @clientid = 1000 
	SET @name = 'John Smith' 
	SET @email = 'john.smith@example.com' 
	SET @phonenumber = '555-1234' 
	SET @address = '123 Main St, Anytown USA' 
	SELECT*FROM vw_Clients_Tables with (UPDLOCK,ROWLOCK)

	WHERE Client_ID=@clientid

	IF @@ROWCOUNT = 0
	BEGIN 
	RAISERROR('Client with ID %d does not exist',16,1,@clientid)
	ROLLBACK TRANSACTION
	RETURN
	END

	UPDATE vw_Clients_Tables SET Client_Name = @name,Client_Email=@email,
	Client_Phone_Number = @phonenumber,Client_Address=@address
	WHERE Client_ID = @clientid
	COMMIT TRANSACTION

--Locking update for financial table 
	BEGIN TRANSACTION 
	DECLARE @transactionid INT, @amount DECIMAL(10,2), @date DATE, @type VARCHAR(50), @description VARCHAR(100)

	SET @transactionid = 1002 
	SET @amount = 100.00 
	SET @date = '2023-04-05' 
	SET @type = 'payment'
	SET @description = 'Payment for rent' 

	SELECT * FROM vw_Financial_Transactions_Tables WITH (UPDLOCK,ROWLOCK)
	WHERE Transaction_ID =@transactionid

	ROLLBACK TRANSACTION 
	RETURN

	UPDATE vw_Financial_Transactions_Tables
	SET Financial_Transactions_Amount=@amount,Financial_Transactions_Date=@date,
	Financial_Transactions_Type = @type,Financial_Transactions_Description = @description
	WHERE Transaction_ID = @transactionid

	COMMIT

--LOCKING update for projetc table
	BEGIN TRANSACTION 
	DECLARE @projectid INT, @Pname VARCHAR(50), @Pdescription VARCHAR(100), @startdate DATE, @endDate DATE
	SET @projectid = 1004
	SET @Pname = 'cancelled'
	SET @Pdescription = 'Green Horizon'
	SET @startdate = '2023-04-01'
	SET @endDate = '2023-06-30'

	SELECT * FROM Projects_Tables WITH (UPDLOCK,ROWLOCK) WHERE Project_ID = @projectid

	IF @@ROWCOUNT = 0 
	BEGIN
	RAISERROR('Project with ID %d does not exist',16,1,@projectid)
	ROLLBACK 
	RETURN
	END
	UPDATE vw_Projects_Tables SET Project_Status = @Pname,Project_Description = @Pdescription,
	Project_Start_Date = @startdate,Project_End_Date = @endDate 
	WHERE Project_ID=@projectid

--LOCKing update for supplier table
	BEGIN TRANSACTION 
	DECLARE @supplierid INT, @sname VARCHAR(50), @semail VARCHAR(50), @saddress VARCHAR(100)

	SET @supplierid = 1002
	SET @sname = 'Future Suppliers Co'
	SET @semail = 'futuresupplier@suppliers.com'
	SET @saddress = '23 lain St, wheretown, UK'

	SELECT*FROM vw_Suppliers_Tables WITH (UPDLOCK,ROWLOCK) WHERE Supplier_ID = @supplierid
	IF @@ROWCOUNT = 0
	BEGIN 
	RAISERROR('Supplier with ID %d does not exist',16,1,@supplierID)
	ROLLBACK
	RETURN
	END
	UPDATE vw_Suppliers_Tables SET Supplier_Name = @sname,Suppliers_Email=@semail,
	Suppliers_Address =@Saddress 
	WHERE Supplier_ID = @supplierid
	COMMIT 



