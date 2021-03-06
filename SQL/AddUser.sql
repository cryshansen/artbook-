USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 03/31/2009 17:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddUser](@Uname varchar(50), @password varchar(50),@Uf_Name varchar(50),@Ul_Name varchar(50), @Email varchar(50), @Sex varchar(1), @Birthday varchar(50),@Image varchar(50))
as

    Set Nocount On
--handle the date field?
If exists (Select Username from UserProfile Where Username = @Uname)
		Raiserror ('Duplicate Username. Please select another.',16,1)

If datalength(@Image) = 0
	Set @Image = null
else
Begin
	Insert into UserProfile(Username, passwrd, F_Name,L_Name, email, sex, birthday,imageloc)
	Values(@Uname, @password, @Uf_Name,@Ul_Name, @Email, @Sex, @Birthday,@Image)
end
if @@error<>0
	RaisError('Could not insert record',16,1)
else
	Select @@Identity as UserId
Return  @@Identity