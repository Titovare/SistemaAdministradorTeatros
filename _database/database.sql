USE [SISTEMA_TEATROS]
GO
/****** Object:  User [app_sysadmin]    Script Date: 9/7/2020 11:05:19 ******/
CREATE USER [app_sysadmin] FOR LOGIN [app_sysadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [app_sysadmin]
GO
