USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[AddUserAlbums]    Script Date: 04/05/2009 15:20:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[AddUserAlbums](@UserId int, @AlbumName varchar(50),@location varchar(125),@albumDesc text,@privacy varchar(75))
as
insert into UserAlbums([UserId],[AlbumName],[location],[Album_desc],[privacy])
values( @UserId,@AlbumName,@location,@albumDesc,@privacy);
return 
Drop Proc [dbo].[AddPhotosAlbums]
Create Proc [dbo].[AddPhotosAlbums](@AlbumId int, @PhotoName varchar(200),@Photocaption text,@Album_cover int)
as
insert into AlbumPhotos([AlbumID],[PhotoName],[Photo_caption],[Album_Cover])
values( @AlbumId,@PhotoName,@Photocaption, @Album_cover);
return 



