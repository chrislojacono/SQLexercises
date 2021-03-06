CREATE TABLE NAMEOFTABLE
	(
	Id int NOT NULL,
	Size int NOT NULL,
	Type varchar(40) NOT NULL,
	Price decimal(18, 2) NOT NULL,
	WeightInOunces int NOT NULL,
	Sliced bit NOT NULL,
	CreatedDate datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Table_1 ADD CONSTRAINT
	DF_Table_1_Sliced DEFAULT 0 FOR Sliced
GO
ALTER TABLE dbo.Table_1 ADD CONSTRAINT
	DF_Table_1_CreatedDate DEFAULT getdate() FOR CreatedDate
GO

------------------------------------------------------------------------------
CREATE TABLE Loaves
	(
	Id int NOT NULL,
	Size int NOT NULL,
	Type varchar(40) NOT NULL,
	Price decimal(18, 2) NOT NULL,
	WeightInOunces int NOT NULL,
	Sliced bit NOT NULL DEFAULT 0,
	CreatedDate datetime NOT NULL DEFAULT getdate()
	) 


-- INSERTING VALUES
insert into Loaves(Id, Size, [Type], Price, WeightInOunces)
Values (1, 3, 'Rustic Italian Pugliese', 5.50, 24) --order DOES matter

insert into Loaves( Size, [Type], Price, WeightInOunces)
output inserted.*  -- or inserted.Id
Values (3, 'Rustic Italian Pugliese', 5.50, 24)

--after changing identity spefication to YES so it creates a PK unique ID for each one


Update Loaves
   Set WeightInOunces = 12,
       Size = 1,
	   Type = 'Rye'
output inserted.*, deleted.* 
Where  id = 2  --ALWAYS SPECIFY WITH A WHERE STATEMENT

