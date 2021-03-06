USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[AddUserAccount]    Script Date: 03/31/2009 17:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddUserAccount](@UserId varchar(10),@Uname varchar(50), @password varchar(50))
as

    Set Nocount On
--handle the date field?
If exists (Select Uname from UserAccounts Where Uname = @Uname)
		Raiserror ('Duplicate Username. Please select another.',16,1)
else
Begin
Insert into UserAccounts(UserId,Uname, UserPassword,InvalidLogonAttempts)
Values(@UserId,@Uname, @password,0)
End
if @@error<>0
RaisError('Could not insert record',16,1)
else
Select @@Identity as UserId
Return 