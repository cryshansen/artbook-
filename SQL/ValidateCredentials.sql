USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[ValidateLogonCredentials]    Script Date: 03/31/2009 17:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ValidateLogonCredentials](@UserName varchar(50), @UserPassword varchar(50))
As

Set NoCount On

If Exists(Select * From UserProfile Where Username=@UserName And passwrd=@UserPassword And InvalidLogonAttempts < 5)
Select 1 As "ValidLogon"
Else
Begin
Update UserProfile
    Set InvalidLogonAttempts = InvalidLogonAttempts + 1
    Where Username = @UserName
Select 0 As "ValidLogon"
End

Return @@Error