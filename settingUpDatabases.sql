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
