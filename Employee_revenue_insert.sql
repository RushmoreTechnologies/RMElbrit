/****** Script for SelectTopNRows command from SSMS  ******/
insert into [EmployeeRevenue] (
      [Division]
      ,[DoctorCode]
      ,[DoctorName]
      ,[EmployeeCode]
      ,[EmployeeName]
      ,[Month]
      ,[TotalRevenue]
      ,[IsActive]
      ,[CreatedBy]
      ,[CreatedOn]
     )

select 
		[Division]
      ,[Dr# Code]
      ,[Dr# Name]
	  ,(select FieldNameExtracted from (select *,CASE WHEN FirstPOS < SecondPOS
		THEN SUBSTRING([Emp Name],FirstPOS + 1, SecondPOS - FirstPOS - 1) END AS FieldNameExtracted from (
		SELECT  *,CHARINDEX('(',[Emp Name]) as FirstPOS
		, CHARINDEX(')',[Emp Name]) as SecondPOS
		FROM dbo.[MSL_Complete_637957673176059402_Sheet1]) a where ab.[Emp Name]=a.[Emp Name] and ab.[Dr# Code]=a.[Dr# Code]) as FieldNameExtracted) as empCode
 ,[Emp Name]
 ,7
 ,[Jul-22 Support] 
 ,1
 ,1
 ,GETDATE()
  FROM [ELBRIT_DEV].[dbo].[MSL_Complete_637957673176059402_Sheet1] as ab where [Jul-22 Support]  is not null
  