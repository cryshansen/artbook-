USE [NaitBook]
GO
/****** Object:  StoredProcedure [dbo].[GetUserStatus]    Script Date: 03/31/2009 17:32:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetUserStatus]
as
SELECT		x.UserId,x.F_Name + ' '+ x.L_Name as Full_Name,
		t.myStatus,
		x.dt
FROM		(
			SELECT		t1.UserId,
					t1.F_Name,t1.L_Name,
					MAX(t2.dateposted) AS dt
			FROM		UserProfile AS t1
			INNER JOIN	UserStatus AS t2 ON t2.UserId = t1.UserId

			GROUP BY	t1.UserId,
t1.F_Name,t1.L_Name
					
		) AS x
INNER JOIN	UserStatus AS t ON t.UserId = x.UserId AND t.dateposted = x.dt
ORDER BY	x.F_Name
