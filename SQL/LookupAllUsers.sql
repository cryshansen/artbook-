USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[LookupAllUsers]    Script Date: 03/31/2009 17:32:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LookupAllUsers]
as
select UserId, F_Name + ' '+ L_Name as Full_Name, email,sex,birthday,imageloc from UserProfile