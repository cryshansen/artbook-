USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetMemberFriends]    Script Date: 04/17/2009 13:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetMemberFriends] (@UserId int)
As
	select UserId, UserProfile.F_Name + ' ' + UserProfile.L_Name as Full_Name,'..\images\'+ UserProfile.imageloc as ImageLoc
	from UserProfile, Friends
	where 
	(UserProfile.UserId = Friends.Friend1Id 
			and	Friends.Friend2Id = 1)-- @UserId)
	or
	(UserProfile.UserId = Friends.Friend2Id 
			and Friends.Friend1Id =1) --@UserId)

Limit 1, 6
	
DECLARE @PageLowerBound int

DECLARE @PageUpperBound int

 -- Set the page bounds

SET @PageLowerBound = @StartRow

SET @PageUpperBound = @PageLowerBound + @PageSize + 1

-- Create a temp table to store the select results

CREATE TABLE MyPageIndex ( IndexId int IDENTITY (1, 1) NOT NULL, ProductID int )

-- Insert into the temp table

INSERT INTO #PageIndex (ProductID) SELECT ProductID

FROM Product ORDER BY ProductID DESC

 -- Return paged results

SELECT P.* FROM Product P, #PageIndex PageIndex

WHERE P.ProductID = PageIndex.ProductID

AND PageIndex.IndexID > @PageLowerBound

AND PageIndex.IndexID < @PageUpperBound

ORDER BY PageIndex.IndexID

END