USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAlbumsById]    Script Date: 04/17/2009 14:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter Proc [dbo].[GetPhotosByAlbumId](@AlbumId int)
as
Select UserAlbums.UserId,' ' as AlbumName,AlbumPhotos.*,'..\images\'+ AlbumPhotos.PhotoName as url from UserAlbums,AlbumPhotos 
where UserAlbums.AlbumId = AlbumPhotos.AlbumId and AlbumPhotos.AlbumId= @AlbumId