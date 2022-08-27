/****** Script for SelectTopNRows command from SSMS  ******/
insert into [EmployeeVisitDetails]( 
		[Division]
      ,[DoctorCode]
      ,[DoctorName]
      ,[EmployeeCode]
      ,[EmployeeName]
      ,[VisitDate]
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
 ,B.Item+'-07-2022'
 --,convert(varchar(4),B.Item)+'-07-2022'
 ,1
 ,1
 ,GETDATE()
  FROM [ELBRIT_DEV].[dbo].[MSL_Complete_637957673176059402_Sheet1] as ab 
  CROSS APPLY [SplitString] ([Jul-22 visit],',') AS B
  where [Jul-22 visit]   is not null