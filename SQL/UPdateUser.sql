USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 03/31/2009 17:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateUser](@UserId int, @password varchar(50), @Email varchar(50), @Image varchar(50))
as

    Set Nocount On
--handle the date field?

Update UserProfile
set passwrd=@password, 
	email=@Email, 
	imageloc=@Image 
	where UserId=@UserId;
if @@error<>0
RaisError('Could not update record',16,1)

--Select @@Identity as UserId
Return @@Error