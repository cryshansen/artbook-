USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[SaveImage]    Script Date: 03/31/2009 17:33:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc  [dbo].[SaveImage](@imageloc varchar(50),@UserId varchar(10))
as
Begin
Update UserProfile set imageloc = @imageloc where UserId=@UserId;
 if @@error<>0
RaisError('add failed',16,1)
end
